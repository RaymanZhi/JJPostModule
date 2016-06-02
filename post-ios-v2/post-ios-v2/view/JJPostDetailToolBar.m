//
//  JJPostDetailToolBar.m
//  PostObject
//
//  Created by 廖智 on 16/5/23.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "JJPostDetailToolBar.h"
#import "PostMacro.h"
#import "Masonry.h"

@interface JJPostDetailToolBar()

@property(nonatomic,strong)UIImageView *headerIcon;
@property(nonatomic,strong)UIImageView *identifyIcon;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIButton* shareBtn;

@end

@implementation JJPostDetailToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = RGBColor(222, 223, 224);
        
        [self addSubview:self.headerIcon];
        [self addSubview:self.identifyIcon];
        [self addSubview:self.nameLabel];
        [self addSubview:self.shareBtn];
        
        [self makeConstraints];
        
    }
    return self;
}

- (void)shareBtnClick:(UIButton *)sender
{
    
}

- (void)makeConstraints
{
    [_headerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(@(40));
        make.height.mas_equalTo(@(40));
    }];

    [_identifyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_headerIcon.mas_right).offset(7);
        make.bottom.mas_equalTo(_headerIcon.mas_bottom).offset(7);
        make.width.mas_equalTo(@(15));
        make.height.mas_equalTo(@(15));
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerIcon.mas_right).offset(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(@(40));
        make.height.mas_equalTo(@(40));
    }];

}
#pragma mark - getter and setter
- (UIImageView *)headerIcon
{
    if (!_headerIcon) {
        _headerIcon = [[UIImageView alloc] init];
        _headerIcon.image = [UIImage imageNamed:@"nickName"];
        _headerIcon.backgroundColor = RGBColor(222, 223, 224);
    }
    return _headerIcon;
}
- (UIImageView *)identifyIcon
{
    if (!_identifyIcon) {
        _identifyIcon = [[UIImageView alloc] init];
        _identifyIcon.backgroundColor = RGBColor(222, 223, 224);
        _identifyIcon.image = [UIImage imageNamed:@"icon_expert_v1"];
        _identifyIcon.hidden = YES;
    }
    return _identifyIcon;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.backgroundColor = RGBColor(222, 223, 224);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.text = @"徐苗";
    }
    return _nameLabel;
}
- (UIButton *)shareBtn
{
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc] init];
        _shareBtn.backgroundColor = RGBColor(222, 223, 224);
        [_shareBtn setImage:[UIImage imageNamed:@"icon_score"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}


@end
