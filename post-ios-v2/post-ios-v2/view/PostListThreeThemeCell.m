//
//  PostListThreeThemeCell.m
//  PostObject
//
//  Created by 廖智 on 16/5/31.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostListThreeThemeCell.h"
#import "Masonry.h"

@interface PostListThreeThemeCell()

@property(nonatomic,strong)UIImageView *bgView1;
@property(nonatomic,strong)UIImageView *classityImage1;
@property(nonatomic,strong)UIView *shadowView1;
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UILabel *subTitleLabel1;
@property(nonatomic,weak)CAGradientLayer *gradientLayer1;

@end

@implementation PostListThreeThemeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self createView];
    }
    return self;
}

- (void)createView
{
    _bgView1 = [UIImageView new];
    _bgView1.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_bgView1];
    
    _classityImage1 = [UIImageView new];
    _classityImage1.backgroundColor = [UIColor greenColor];
    [_bgView1 addSubview:_classityImage1];
    
    _shadowView1 = [[UIView alloc] init];
    
    _gradientLayer1 = [CAGradientLayer layer];
    _gradientLayer1.bounds = _shadowView1.bounds;
    _gradientLayer1.borderWidth = 0;
    _gradientLayer1.frame = _shadowView1.bounds;
    _gradientLayer1.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor],(id)[UIColor blackColor], nil];
    _gradientLayer1.startPoint = CGPointMake(0.5, 0.5);
    _gradientLayer1.endPoint = CGPointMake(0.5, 1.0);
    [_shadowView1.layer insertSublayer:_gradientLayer1 atIndex:0];
    
    [_bgView1 addSubview:_shadowView1];
    
    _titleLabel1 = [UILabel new];
    _titleLabel1.backgroundColor = [UIColor clearColor];
    _titleLabel1.textColor = [UIColor whiteColor];
    _titleLabel1.text = @"家健";
    _titleLabel1.font = [UIFont boldSystemFontOfSize:18.0];
    [_bgView1 addSubview:_titleLabel1];
    
    _subTitleLabel1 = [UILabel new];
    _subTitleLabel1.backgroundColor = [UIColor clearColor];
    _subTitleLabel1.textColor = [UIColor whiteColor];
    _subTitleLabel1.text = @"最新动态";
    _subTitleLabel1.font = [UIFont systemFontOfSize:16.0];
    [_bgView1 addSubview:_subTitleLabel1];
    
    [self makeConstraints];
}
- (void)makeConstraints
{
    [_bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.width.mas_equalTo(@(80));
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [_classityImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bgView1.mas_left);
        make.width.mas_equalTo(@(25));
        make.top.mas_equalTo(_bgView1.mas_top);
        make.height.mas_equalTo(@(18));
    }];
    
    [_shadowView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bgView1.mas_left);
        make.right.mas_equalTo(_bgView1.mas_right);
        make.height.mas_equalTo(@(40));
        make.bottom.mas_equalTo(_bgView1.mas_bottom);
    }];
    
    [_subTitleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_bgView1.mas_right).offset(-10);
        make.bottom.mas_equalTo(_bgView1.mas_bottom).offset(-10);
    }];
    
    [_titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_bgView1.mas_right).offset(-10);
        make.bottom.mas_equalTo(_subTitleLabel1.mas_top).offset(-10);
    }];
}

- (void)setThreeImageModel
{
    // to do 赋值
}

@end
