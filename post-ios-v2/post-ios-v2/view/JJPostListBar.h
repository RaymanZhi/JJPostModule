//
//  JJPostListBar.h
//  PostObject
//
//  Created by 廖智 on 16/5/21.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostMacro.h"

@interface JJPostListBar : UIScrollView

@property(nonatomic,copy) void(^arrowChange)();
@property(nonatomic,copy) void(^listBarItemClickBlock)(NSString *item, NSInteger itemIndex);

@property(nonatomic,strong)NSMutableArray *visibleItemList;

- (void)operationFromBlock:(animateType)type itemName:(NSString *)itemName index:(int)index;
- (void)itemClickScrollWithIndex:(NSInteger)index;

@end
