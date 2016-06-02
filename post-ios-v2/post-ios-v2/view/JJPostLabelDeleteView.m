//
//  JJPostLabelDeleteView.m
//  PostObject
//
//  Created by 廖智 on 16/5/23.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "JJPostLabelDeleteView.h"

@interface JJPostLabelDeleteView()

@end

@implementation JJPostLabelDeleteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeNewBar];
        self.hidden= YES;
    }
    return self;
}
-(void)makeNewBar
{
    self.backgroundColor = RGBColor(238.0, 238.0, 238.0);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 30)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.text = @"我的栏目";
    [self addSubview:label];
    
    if (!self.hitText) {
        self.hitText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+10,10, 100, 11)];
        self.hitText.font = [UIFont systemFontOfSize:11];
        self.hitText.text = @"拖拽可以排序";
        self.hitText.textColor = RGBColor(170.0, 170.0, 170.0);
        self.hitText.hidden = YES;
        [self addSubview:self.hitText];
    }
    
    if (!self.sortBtn) {
        self.sortBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW-100, 5, 50, 20)];
        [self.sortBtn setTitle:@"编辑" forState:0];
        [self.sortBtn setTitleColor:[UIColor blueColor] forState:0];
        self.sortBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        self.sortBtn.layer.cornerRadius = 5;
        self.sortBtn.layer.borderWidth = 0.5;
        [self.sortBtn.layer setMasksToBounds:YES];
        self.sortBtn.layer.borderColor = [[UIColor blueColor] CGColor];
        [self.sortBtn addTarget:self
                         action:@selector(sortBtnClick:)
               forControlEvents:1<<6];
        [self addSubview:self.sortBtn];
    }
    
}

-(void)sortBtnClick:(UIButton *)sender{
    if (sender.selected) {
        [sender setTitle:@"编辑" forState:0];
        self.hitText.hidden = YES;
    }
    else{
        [sender setTitle:@"完成" forState:0];
        self.hitText.hidden = NO;
    }
    sender.selected = !sender.selected;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sortBtnClick"
                                                        object:sender
                                                      userInfo:nil];
}
@end
