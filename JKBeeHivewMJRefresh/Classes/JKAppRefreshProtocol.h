//
//  AppRefreshProtocol.h
//  zujianhuademo
//
//  Created by songjk on 2020/5/11.
//  Copyright © 2020 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHServiceProtocol.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^JKRefreshAndLoadMoreHandle)(void);

@protocol JKAppRefreshProtocol <NSObject,BHServiceProtocol>


///添加下拉刷新
- (void)addPullRefreshForScrollView:(UIScrollView *)scrollView
pullRefreshCallBack:(JKRefreshAndLoadMoreHandle)pullRefreshCallBackBlock;
/** 开始下拉刷新*/
- (void)beginPullRefreshForScrollView:(UIScrollView *)scrollView;
/**停止下拉刷新*/
- (void)endRefreshForScrollView:(UIScrollView *)scrollView;

/**判断头部是否在刷新*/
- (BOOL)headerIsRefreshForScrollView:(UIScrollView *)scrollView;

///添加上拉加载更多  默认没有显示 “没有更多了~”
- (void)addLoadMoreForScrollView:(UIScrollView *)scrollView
loadMoreCallBack:(JKRefreshAndLoadMoreHandle)loadMoreCallBackBlock;

/**上拉*/
- (void)addLoadMoreForScrollView:(UIScrollView *)scrollView text:(NSString *)text
                loadMoreCallBack:(JKRefreshAndLoadMoreHandle)loadMoreCallBackBlock;


//开始上拉加载更多动画
-(void)beginLoadMoreRefreshForScrollView:(UIScrollView *)scrollView;


/**判断是否尾部在刷新*/
- (BOOL)footerIsLoadingForScrollView:(UIScrollView *)scrollView ;

/**提示没有更多数据的情况*/
- (void)noticeNoMoreDataForScrollView:(UIScrollView *)scrollView ;

/**重置footer*/
- (void)resetNoMoreDataForScrollView:(UIScrollView *)scrollView ;

/**停止上拉加载*/
- (void)endLoadMoreForScrollView:(UIScrollView *)scrollView ;

/** 隐藏footer*/
- (void)hiddenFooterForScrollView:(UIScrollView *)scrollView ;

/**隐藏header*/
- (void)hiddenHeaderForScrollView:(UIScrollView *)scrollView ;
@end

NS_ASSUME_NONNULL_END
