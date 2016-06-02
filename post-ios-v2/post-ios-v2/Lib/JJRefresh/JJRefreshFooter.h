//
//  JJRefreshFooter.h
//  JJPostModule
//
//  Created by 廖智 on 16/5/28.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^BeginRefreshingBlock)(void);

@interface JJRefreshFooter : NSObject

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,assign)BOOL autoAdjustScrollView;

@property(nonatomic,copy)BeginRefreshingBlock beginRefreshingBlock;

- (void)footer;
- (void)beginRefreshing;
- (void)endRefreshing;

@end
