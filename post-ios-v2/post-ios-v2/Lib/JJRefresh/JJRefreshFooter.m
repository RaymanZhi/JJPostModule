//
//  JJRefreshFooter.m
//  JJPostModule
//
//  Created by 廖智 on 16/5/28.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "JJRefreshFooter.h"

@interface JJRefreshFooter()
{
    float contentHeight;
    float scrollFrameHeight;
    float footerHeight;
    float scrollWidth;
    BOOL isAdd;          //是否添加了footer,默认是NO
    BOOL isRefresh;      //是否正在刷新,默认是NO
    
    UIView *footerView;
    UIActivityIndicatorView *activityView;
}
@end

@implementation JJRefreshFooter

- (void)footer
{
    scrollWidth = _scrollView.frame.size.width;
    footerHeight = 35;
    scrollFrameHeight = _scrollView.frame.size.height;
    isAdd = NO;
    isRefresh = NO;
    footerView = [[UIView alloc] init];
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew |  NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (![@"contentOffset" isEqualToString:keyPath]) {
        return;
    }
    
    contentHeight = _scrollView.contentSize.height;
    if (!isAdd) {
        isAdd = YES;
        footerView.frame = CGRectMake(0, contentHeight, scrollWidth, footerHeight);
        [_scrollView addSubview:footerView];
        activityView.frame = CGRectMake((scrollWidth - footerHeight)/2, 0, footerHeight, footerHeight);
        [footerView addSubview:activityView];
    }
    
    footerView.frame = CGRectMake(0, contentHeight, scrollWidth, footerHeight);
    activityView.frame = CGRectMake((scrollWidth - footerHeight)/2, 0, footerHeight, footerHeight);
    int currentPostion = _scrollView.contentOffset.y;
    // 刷新
    if ((currentPostion > (contentHeight - scrollFrameHeight)) && (contentHeight > scrollFrameHeight)) {
        [self beginRefreshing];
        return;
    }
    
//    NSLog(@"%d, %f, %f,%f",currentPostion,contentHeight-scrollFrameHeight,contentHeight, scrollFrameHeight);
}

- (void)beginRefreshing
{
    if (!isRefresh) {
        isRefresh = YES;
        [activityView startAnimating];
        
        [UIView animateWithDuration:0.3 animations:^{
            _scrollView.contentInset = UIEdgeInsetsMake(0, 0, footerHeight, 0);
            footerView.hidden = NO;
        }];
        _beginRefreshingBlock();
    }
}

- (void)endRefreshing
{
    isRefresh = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            [activityView stopAnimating];
            _scrollView.contentInset = self.autoAdjustScrollView ? UIEdgeInsetsMake(64, 0, 49, 0) : UIEdgeInsetsMake(0, 0, 0, 0);
            footerView.hidden = YES;
        }];
    });
}
//观察者 注销
- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end









