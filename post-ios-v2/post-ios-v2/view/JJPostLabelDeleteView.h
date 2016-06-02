//
//  JJPostLabelDeleteView.h
//  PostObject
//
//  Created by 廖智 on 16/5/23.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostMacro.h"

@interface JJPostLabelDeleteView : UIView

@property(nonatomic,strong)UILabel *hitText;
@property(nonatomic,strong)UIButton *sortBtn;

- (void)sortBtnClick:(UIButton *)sender;

@end
