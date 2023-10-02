package com.example.dlsh.activity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.example.dlsh.R;
import com.example.dlsh.util.Constant;
import com.example.dlsh.util.InforUtil;
import com.example.dlsh.util.OnlineVideoListItem;
import com.example.dlsh.util.StrListChange;
import com.example.dlsh.util.VideoListItem;
import com.example.dlsh.util.VideoWatchAdapter;
import com.volokh.danylo.video_player_manager.manager.PlayerItemChangeListener;
import com.volokh.danylo.video_player_manager.manager.SingleVideoPlayerManager;
import com.volokh.danylo.video_player_manager.manager.VideoPlayerManager;
import com.volokh.danylo.video_player_manager.meta.MetaData;
import com.volokh.danylo.visibility_utils.calculator.DefaultSingleItemCalculatorCallback;
import com.volokh.danylo.visibility_utils.calculator.ListItemsVisibilityCalculator;
import com.volokh.danylo.visibility_utils.calculator.SingleListViewItemActiveCalculator;
import com.volokh.danylo.visibility_utils.scroll_utils.RecyclerViewItemPositionGetter;

import java.util.ArrayList;
import java.util.List;

/*liao -------2022-2-5*/
public class HsmfdActivity extends FragmentActivity implements View.OnClickListener
{
    public static HsmfdActivity activity;
    ViewPager viewPager;//滑动框
    private ArrayList<View> fragments;//轮图管理
    MyPagerAdapter adapter;//轮图适配器
    TextView page1;//按键1
    TextView page2;//按键2
    WebSettings webSettings;//网页设置
    WebView mh;//漫画

    boolean isPlaying;//判断是否在播放界面
    //获取律师信息
    private List<String[]> rel=new ArrayList<>();
    String result;
    private RecyclerView mRecyclerView;//视频播放列表
    //视频数据，相当于普通adapter里的datas
    private List<VideoListItem> mLists = new ArrayList<VideoListItem>();
    //它充当ListItemsVisibilityCalculator和列表（ListView, RecyclerView）之间的适配器（Adapter）。
    private RecyclerViewItemPositionGetter mItemsPositionGetter;

    private final ListItemsVisibilityCalculator mVideoVisibilityCalculator =
            new SingleListViewItemActiveCalculator(new DefaultSingleItemCalculatorCallback(), mLists);

    //SingleVideoPlayerManager就是只能同时播放一个视频。
    //当一个view开始播放时，之前那个就会停止
    private final VideoPlayerManager<MetaData> mVideoPlayerManager = new SingleVideoPlayerManager(new PlayerItemChangeListener() {
        @Override
        public void onPlayerItemChanged(MetaData metaData) {
        }
    });
    private int mScrollState;
    private LinearLayoutManager mLayoutManager = new LinearLayoutManager(this);
    private static final String URL =
            Constant.ADD_PRE+"video/";


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_hsmfd);
        activity=this;
        init();
        mVideoPlayerManager.stopAnyPlayback(); // 页面不显示时, 暂停播放器
    }
    //监听
    @Override
    public void onClick(View view) {

    }
    public void init()
    {
        GetSPInforThread getSPInforThread=new GetSPInforThread();
        getSPInforThread.start();
        try {
            getSPInforThread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        LayoutInflater li = getLayoutInflater();

        //加载第一个webview
        View hsmfd_pager1=li.inflate(R.layout.activity_hsmfd_pager1,null,false);
        mh = hsmfd_pager1.findViewById(R.id.pfmh_mh);
        mh.setVerticalScrollBarEnabled(false); //去除上下滑动
        mh.setHorizontalScrollBarEnabled(false);//去除左右滑动
        mh.setInitialScale(100); //这个一般用来设置缩放倍率
        webSettings=mh.getSettings();
        webSettings.setJavaScriptEnabled(true);
        mh.clearCache(true);
        mh.loadUrl( Constant.ADD_PRE+"pfmh_hsmfd_layout.jsp");
        mh.setWebChromeClient(new WebChromeClient() {
            //这里设置获取到的网站title
            @Override
            public void onReceivedTitle(WebView view, String title) {
                super.onReceivedTitle(view, title);

            }
        });


        mh.setWebViewClient(new WebViewClient() {
            //在webview里打开新链接
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                view.loadUrl(url);
                return true;
            }
        });


        page1=this.findViewById(R.id.page1);
        page2=this.findViewById(R.id.page2);
        viewPager=this.findViewById(R.id.hsmfd_viewpager);
        fragments = new ArrayList<View>();

        //加载视频界面
        View hsmfd_pager2=li.inflate(R.layout.activity_hsmfd_pager2,null,false);
        mRecyclerView = (RecyclerView)hsmfd_pager2.findViewById(R.id.pfsp_listview);
        initVideoPlayer();

        //加载漫画
        fragments.add(hsmfd_pager2);
        //加载视频
        fragments.add(hsmfd_pager1);

        //设置view pager适配器
        adapter = new MyPagerAdapter(fragments);
        viewPager.setAdapter(adapter);
        viewPager.setOnPageChangeListener(
                new ViewPager.OnPageChangeListener()
                {

                    @Override
                    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                    }

                    @Override
                    public void onPageSelected(int position) {
                        if (position==0)
                        {
                            isPlaying=true;
                            page1.setBackgroundResource(R.drawable.activity_hsmfd_page1);
                            page1.setTextColor(getResources().getColor(R.color.white));
                            page2.setBackgroundResource(R.drawable.activity_hsmfd_page2);
                            page2.setTextColor(getResources().getColor(R.color.red));
                        }
                        else
                        {
                            isPlaying=false;
                            mVideoPlayerManager.stopAnyPlayback(); // 页面不显示时, 暂停播放器
                            page1.setBackgroundResource(R.drawable.activity_hsmfd_page4);
                            page1.setTextColor(getResources().getColor(R.color.red));
                            page2.setBackgroundResource(R.drawable.activity_hsmfd_page3);
                            page2.setTextColor(getResources().getColor(R.color.white));
                        }
                    }

                    @Override
                    public void onPageScrollStateChanged(int state) {

                    }
                }
        );
    }

    @Override
    protected void onPause() {
        super.onPause();
        mVideoPlayerManager.stopAnyPlayback(); // 页面不显示时, 暂停播放器
    }

    @Override
    protected void onResume() {
        super.onResume();
        if(!mLists.isEmpty()){
            // need to call this method from list view handler in order to have filled list

            mRecyclerView.post(new Runnable() {
                @Override
                public void run() {

                    mVideoVisibilityCalculator.onScrollStateIdle(
                            mItemsPositionGetter,
                            mLayoutManager.findFirstVisibleItemPosition(),
                            mLayoutManager.findLastVisibleItemPosition());


                }
            });

        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        mVideoPlayerManager.resetMediaPlayer(); // 页面不显示时, 释放播放器
    }

    @Override
    protected void onRestart() {
        super.onRestart();
    }

    public class MyPagerAdapter extends PagerAdapter {
        private ArrayList<View> viewLists;

        public MyPagerAdapter() {
        }

        public MyPagerAdapter(ArrayList<View> viewLists) {
            super();
            this.viewLists = viewLists;
        }

        @Override
        public int getCount() {
            return viewLists.size();
        }

        @Override
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override
        public Object instantiateItem(ViewGroup container, int position) {
            container.addView(viewLists.get(position));
            return viewLists.get(position);
        }

        @Override
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView(viewLists.get(position));
        }
    }
    //初始化视频播放器
    public void initVideoPlayer()
    {
        mLists.clear();
        //添加视频数据
        for (int i = 0; i < rel.size(); i++) {
            mLists.add(new OnlineVideoListItem(mVideoPlayerManager, rel.get(i)[5], Constant.ADD_PRE+"img/mhtp_10006.png", URL+rel.get(i)[1]));

        }
        mRecyclerView.setLayoutManager(mLayoutManager);
        VideoWatchAdapter adapter = new VideoWatchAdapter(mLists);
        mRecyclerView.setAdapter(adapter);
        mRecyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {

            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int scrollState) {
                mScrollState = scrollState;
                if(scrollState == RecyclerView.SCROLL_STATE_IDLE && !mLists.isEmpty()){

                    mVideoVisibilityCalculator.onScrollStateIdle(
                            mItemsPositionGetter,
                            mLayoutManager.findFirstVisibleItemPosition(),
                            mLayoutManager.findLastVisibleItemPosition());
                }
            }

            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                if(!mLists.isEmpty()){
                    mVideoVisibilityCalculator.onScroll(
                            mItemsPositionGetter,
                            mLayoutManager.findFirstVisibleItemPosition(),
                            mLayoutManager.findLastVisibleItemPosition() - mLayoutManager.findFirstVisibleItemPosition() + 1,
                            mScrollState);
                }
            }
        });
        mItemsPositionGetter = new RecyclerViewItemPositionGetter(mLayoutManager, mRecyclerView);


    }
    private class GetSPInforThread extends Thread
    {
        @Override
        public void run() {
            result= InforUtil.getAllSPInfor();

            if (result==null)
            {

            }
            else
            {
                rel.clear();
                String[] str= StrListChange.StrToArray(result);
                for (int i=0;i<str.length;i+=7)
                {
                    String[] temp=new String[]{str[i],str[i+1],str[i+2],str[i+3],str[i+4],str[i+5],str[i+6]};
                    rel.add(temp);
                }
            }
        }
    }
}
