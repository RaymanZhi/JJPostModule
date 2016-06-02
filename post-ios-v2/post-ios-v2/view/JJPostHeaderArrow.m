//
//  JJPostHeaderArrow.m
//  PostObject
//
//  Created by 廖智 on 16/5/21.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "JJPostHeaderArrow.h"
#import "PostMacro.h"

@implementation JJPostHeaderArrow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"Arrow"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"Arrow"] forState:UIControlStateHighlighted];
        self.backgroundColor = RGBColor(255, 255, 255);
        [self addTarget:self action:@selector(arrowClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)arrowClick
{
    if (self.arrowBtnClick) {
        self.arrowBtnClick();
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageSize = 18;
    return CGRectMake((contentRect.size.width - imageSize)/2, (30 - imageSize)/2, imageSize, imageSize);
}

@end
