//
//  PostListThreeImageCell.m
//  PostObject
//
//  Created by 廖智 on 16/5/31.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostListThreeImageCell.h"
#import "Masonry.h"

@interface PostListThreeImageCell()

@property(nonatomic,strong)UIImageView *postImageView1;
@property(nonatomic,strong)UIImageView *postImageView2;
@property(nonatomic,strong)UIImageView *postImageView3;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *classifyLabel;
@property(nonatomic,strong)UILabel *dateLabel;

@end

@implementation PostListThreeImageCell

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
    _postImageView1 = [UIImageView new];
    _postImageView1.backgroundColor = [UIColor whiteColor];
    _postImageView1.contentMode = UIViewContentModeScaleAspectFit;
    _postImageView1.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:_postImageView1];
    
    _postImageView2 = [UIImageView new];
    _postImageView2.backgroundColor = [UIColor whiteColor];
    _postImageView2.contentMode = UIViewContentModeScaleAspectFit;
    _postImageView2.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:_postImageView2];
    
    _postImageView3 = [UIImageView new];
    _postImageView3.backgroundColor = [UIColor whiteColor];
    _postImageView3.contentMode = UIViewContentModeScaleAspectFit;
    _postImageView3.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:_postImageView3];
    
    _contentLabel = [UILabel new];
    _contentLabel.backgroundColor = [UIColor whiteColor];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.text = @"孕期，这几点很多孕妇都不清楚";
    _contentLabel.font = [UIFont systemFontOfSize:16.0];
    _contentLabel.numberOfLines = 2;
    [self.contentView addSubview:_contentLabel];
    
    _classifyLabel = [UILabel new];
    _classifyLabel.backgroundColor = [UIColor whiteColor];
    _classifyLabel.textColor = [UIColor grayColor];
    _classifyLabel.text = @"健康";
    _classifyLabel.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:_classifyLabel];
    
    _dateLabel = [UILabel new];
    _dateLabel.backgroundColor = [UIColor whiteColor];
    _dateLabel.textColor = [UIColor grayColor];
    _dateLabel.font = [UIFont systemFontOfSize:14.0];
    _dateLabel.text = @"1天前";
    [self.contentView addSubview:_dateLabel];
    
    [self makeConstraints];
}
- (void)makeConstraints
{
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
    }];
    
    [_postImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(60));
        make.height.mas_equalTo(@(60));
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
    }];
    
    [_postImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(60));
        make.height.mas_equalTo(@(60));
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(_postImageView1.mas_right).offset(10);
    }];
    
    [_postImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(60));
        make.height.mas_equalTo(@(60));
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(_postImageView2.mas_right).offset(10);
    }];
    
    [_classifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

- (void)setThreeImageModel
{
    // to do 赋值
}



@end
