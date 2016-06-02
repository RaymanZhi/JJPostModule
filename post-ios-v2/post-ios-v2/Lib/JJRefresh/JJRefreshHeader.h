//
//  JJRefreshHeader.h
//  JJPostModule
//
//  Created by 廖智 on 16/5/28.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^BeginRefreshingBlock)(void);

#define kRefreshHeaderTitleLoading @"正在载入…"
#define kRefreshHeaderTitlePullDown @"下拉可刷新"
#define kRefreshHeaderTitleRelease @"松开以刷新"

@interface JJRefreshHeader : NSObject

@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,copy) BeginRefreshingBlock beginRefreshingBlock;

@property(nonatomic,copy) NSString *titleLoading;
@property(nonatomic,copy) NSString *titlePullDown;
@property(nonatomic,copy) NSString *titleRelease;

-(void)header;
-(void)beginRefreshing;
-(void)endRefreshing;  //加在UIScrollView数据刷新后

@end
