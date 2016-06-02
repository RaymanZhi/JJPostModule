//
//  JJRefreshHeader.m
//  JJPostModule
//
//  Created by 廖智 on 16/5/28.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "JJRefreshHeader.h"

@interface JJRefreshHeader()
{
    float lastPostion;
    float contentHeight;
    float headerHeight;
    BOOL isRefresh;
    
    UILabel *headerLabel;
    UIView *headerView;
    UIImageView *headerImageView;
    UIActivityIndicatorView *activityView;
}
@end

@implementation JJRefreshHeader

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleLoading = kRefreshHeaderTitleLoading;
        _titlePullDown = kRefreshHeaderTitlePullDown;
        _titleRelease = kRefreshHeaderTitleRelease;
    }
    return self;
}

- (void)header
{
    isRefresh = NO;
    lastPostion = 0;
    headerHeight = 35;
    float scrollWidth = _scrollView.frame.size.width;
    float imageWidth = 13;
    float imageHeight = headerHeight;
    float labelWidth = 130;
    float labelHeight = headerHeight;
    
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -headerHeight - 10, _scrollView.frame.size.width, headerHeight)];
    [_scrollView addSubview:headerView];
    
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake((scrollWidth - labelWidth)/2, 0, labelWidth, labelHeight)];
    [headerView addSubview:headerLabel];
    
    headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake((scrollWidth - labelWidth)/2 - imageWidth, 0, imageWidth, imageHeight)];
    [headerView addSubview:headerImageView];
    headerImageView.image = [UIImage imageNamed:@"down"];
    
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.frame = CGRectMake((scrollWidth - labelWidth)/2 - imageWidth, 0, imageWidth, imageHeight);
    [headerView addSubview:activityView];
    
    activityView.hidden = YES;
    headerImageView.hidden = NO;
    
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (![@"contentOffset" isEqualToString:keyPath]){
        return;
    }
    contentHeight=_scrollView.contentSize.height;
    
    if (_scrollView.dragging) {  //判断是否在拖动
        int currentPostion = _scrollView.contentOffset.y;
        
        if (!isRefresh) {
            [UIView animateWithDuration:0.3 animations:^{
                if (currentPostion < -headerHeight*1.5) {
                    headerLabel.text = _titleRelease;
                    headerImageView.transform = CGAffineTransformMakeRotation(M_PI);
                }else {
                    int currentPostion = _scrollView.contentOffset.y;
                    if (currentPostion - lastPostion > 5) {
                        lastPostion = currentPostion;
                        headerImageView.transform = CGAffineTransformMakeRotation(M_PI*2);
                        headerLabel.text = _titlePullDown;
                    }else if (lastPostion - currentPostion > 5) {
                        lastPostion = currentPostion;
                    }
                }
            }];
        }
    }else {
        if ([headerLabel.text isEqualToString:_titleRelease]) {
            [self beginRefreshing];
        }
    }
}

- (void)beginRefreshing
{
    if (!isRefresh) {
        isRefresh = YES;
        headerLabel.text = _titleLoading;
        headerImageView.hidden = YES;
        activityView.hidden = NO;
        [activityView startAnimating];
        
        [UIView animateWithDuration:0.3 animations:^{
            CGPoint point= _scrollView.contentOffset;
            if (point.y > -headerHeight * 1.5) {
                _scrollView.contentOffset=CGPointMake(0, point.y - headerHeight*1.5);
            }
            _scrollView.contentInset=UIEdgeInsetsMake(headerHeight * 1.5, 0, 0, 0);
        }];
        
        _beginRefreshingBlock();
    }
    
}
- (void)endRefreshing   //加在UIScrollView数据刷新后
{
    isRefresh=NO;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            CGPoint point= _scrollView.contentOffset;
            if (point.y != 0) {
                _scrollView.contentOffset=CGPointMake(0, point.y + headerHeight * 1.5);
            }
            headerLabel.text = _titlePullDown;
            _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            headerImageView.hidden = NO;
            headerImageView.transform = CGAffineTransformMakeRotation(M_PI * 2);
            [activityView stopAnimating];
            activityView.hidden = YES;
        }];
    });
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}



@end




