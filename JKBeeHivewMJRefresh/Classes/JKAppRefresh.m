//
//  AppRefresh.m
//  zujianhuademo
//
//  Created by songjk on 2020/5/11.
//  Copyright © 2020 songjk. All rights reserved.
//

#import "JKAppRefresh.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
    #import <MJRefresh/MJRefresh.h>
#else
    
#endif


@BeeHiveService(AppRefreshProtocol,AppRefresh)
//#import <MJRefresh/MJRefresh.h>
@implementation JKAppRefresh

- (BOOL)singleton {
    return YES;
}

/** 开始下拉刷新*/
- (void)beginPullRefreshForScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_header beginRefreshing];
}
//开始上拉加载更多动画
-(void)beginLoadMoreRefreshForScrollView:(UIScrollView *)scrollView{
    [scrollView.mj_footer beginRefreshing];
}

/**判断头部是否在刷新*/
- (BOOL)headerIsRefreshForScrollView:(UIScrollView *)scrollView {
    
    BOOL flag =  scrollView.mj_header.isRefreshing;
    return flag;
}

/**判断是否尾部在刷新*/
- (BOOL)footerIsLoadingForScrollView:(UIScrollView *)scrollView {
    return  scrollView.mj_footer.isRefreshing;
}

/**提示没有更多数据的情况*/
- (void)noticeNoMoreDataForScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_footer endRefreshingWithNoMoreData];
}

/**重置footer*/
- (void)resetNoMoreDataForScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_footer resetNoMoreData];
}

/**停止下拉刷新*/
- (void)endRefreshForScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_header endRefreshing];
}

/**停止上拉加载*/
- (void)endLoadMoreForScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_footer endRefreshing];
}

/** 隐藏footer*/
- (void)hiddenFooterForScrollView:(UIScrollView *)scrollView {
    // 不确定是哪个类型的footer
    scrollView.mj_footer.hidden = YES;
}

/**隐藏header*/
- (void)hiddenHeaderForScrollView:(UIScrollView *)scrollView {
    scrollView.mj_header.hidden = YES;
}

/**上拉*/
- (void)addLoadMoreForScrollView:(UIScrollView *)scrollView text:(NSString *)text
                loadMoreCallBack:(JKRefreshAndLoadMoreHandle)loadMoreCallBackBlock {
    
    if (scrollView == nil || loadMoreCallBackBlock == nil) {
        return ;
    }
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (loadMoreCallBackBlock) {
            loadMoreCallBackBlock();
        }
    }];
    [footer setTitle:text forState:MJRefreshStateIdle];
    [footer setTitle:@"正在为您加载数据" forState:MJRefreshStateRefreshing];
    [footer setTitle:text forState:MJRefreshStateNoMoreData];
    //footer.stateLabel.textColor = [];
    footer.stateLabel.font = [UIFont systemFontOfSize:13.0];
    //    footer.automaticallyHidden = YES;
    scrollView.mj_footer = footer;
    footer.backgroundColor = [UIColor whiteColor];
    
    
}
- (void)addLoadMoreForScrollView:(UIScrollView *)scrollView
                loadMoreCallBack:(JKRefreshAndLoadMoreHandle)loadMoreCallBackBlock {
    
    if (scrollView == nil || loadMoreCallBackBlock == nil) {
        return ;
    }
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (loadMoreCallBackBlock) {
            loadMoreCallBackBlock();
        }
    }];
    footer.stateLabel.textColor = [UIColor darkGrayColor];
    [footer setTitle:@"点击加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在为您加载数据" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多了~" forState:MJRefreshStateNoMoreData];
    //footer.stateLabel.textColor = stateLabelTextColor;
    footer.stateLabel.font = [UIFont systemFontOfSize:13.0];
//    footer.automaticallyHidden = YES;
    scrollView.mj_footer = footer;
    footer.backgroundColor = [UIColor whiteColor];
    
    
}

/**下拉*/
- (void)addPullRefreshForScrollView:(UIScrollView *)scrollView
                pullRefreshCallBack:(JKRefreshAndLoadMoreHandle)pullRefreshCallBackBlock {
    __weak typeof(UIScrollView *)weakScrollView = scrollView;
    if (scrollView == nil || pullRefreshCallBackBlock == nil) {
        return ;
    }
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (pullRefreshCallBackBlock) {
            pullRefreshCallBackBlock();
        }
        if (weakScrollView.mj_footer.hidden == NO) {
            [weakScrollView.mj_footer resetNoMoreData];
        }
        
    }];
    header.stateLabel.textColor = [UIColor darkGrayColor];
    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在更新" forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"没有发现更多数据~" forState:MJRefreshStateNoMoreData];
//    [header ]
    header.stateLabel.font = [UIFont systemFontOfSize:13.0];
//    header.stateLabel.textColor = stateLabelTextColor;
    header.lastUpdatedTimeLabel.hidden = YES;
    
    scrollView.mj_header = header;
}


@end
