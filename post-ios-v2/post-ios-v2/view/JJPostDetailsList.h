//
//  JJPostDetailsList.h
//  PostObject
//
//  Created by 廖智 on 16/5/23.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostMacro.h"

@interface JJPostDetailsList : UIScrollView

@property (nonatomic,strong) NSMutableArray *topView;
@property (nonatomic,strong) NSMutableArray *bottomView;
@property (nonatomic,strong) NSMutableArray *listAll;

@property (nonatomic,copy) void(^longPressedBlock)();
@property (nonatomic,copy) void(^opertionFromItemBlock)(animateType type, NSString *itemName, int index);
-(void)itemRespondFromListBarClickWithItemName:(NSString *)itemName;

@end
