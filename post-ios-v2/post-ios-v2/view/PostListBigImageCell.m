//
//  PostListBigImageCell.m
//  PostObject
//
//  Created by 廖智 on 16/5/31.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostListBigImageCell.h"
#import "Masonry.h"
//#import "UIImageView+WebCache.h"

@interface PostListBigImageCell()

@property(nonatomic,strong)UIImageView *bigImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *subTitleLabel;
@property(nonatomic,strong)UIView *shadowView;
@property(nonatomic,weak)CAGradientLayer *gradientLayer;

@end

@implementation PostListBigImageCell

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
    _bigImageView = [UIImageView new];
    _bigImageView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_bigImageView];
    
    _shadowView = [[UIView alloc] init];
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.bounds = _shadowView.bounds;
    _gradientLayer.borderWidth = 0;
    _gradientLayer.frame = _shadowView.bounds;
    _gradientLayer.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor],(id)[UIColor blackColor], nil];
    _gradientLayer.startPoint = CGPointMake(0.5, 0.5);
    _gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    [_shadowView.layer insertSublayer:_gradientLayer atIndex:0];
    
    [_bigImageView addSubview:_shadowView];
    
    _titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = @"魏则西之死";
    _titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [_bigImageView addSubview:_titleLabel];
    
    _subTitleLabel = [UILabel new];
    _subTitleLabel.backgroundColor = [UIColor clearColor];
    _subTitleLabel.textColor = [UIColor whiteColor];
    _subTitleLabel.text = @"捅破“邪恶故事”的窗户纸";
    _subTitleLabel.font = [UIFont systemFontOfSize:16.0];
    [_bigImageView addSubview:_subTitleLabel];
    
    [self makeConstraints];
}
- (void)makeConstraints
{
    [_bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [_shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bigImageView.mas_left);
        make.right.mas_equalTo(_bigImageView.mas_right);
        make.height.mas_equalTo(@(100));
        make.bottom.mas_equalTo(_bigImageView.mas_bottom);
    }];
    
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bigImageView.mas_left).offset(10);
        make.bottom.mas_equalTo(_bigImageView.mas_bottom).offset(-10);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bigImageView.mas_left).offset(10);
        make.bottom.mas_equalTo(_subTitleLabel.mas_top).offset(-10);
    }];
    
    
}

- (void)setCellModel:(BigImageCellModel *)cellModel
{
    // to do 赋值
}

@end
