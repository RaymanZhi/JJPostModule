//
//  PostListOneImageCell.m
//  PostObject
//
//  Created by 廖智 on 16/5/31.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostListOneImageCell.h"
#import "Masonry.h"

@interface PostListOneImageCell()

@property(nonatomic,strong)UIImageView *postImageView;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *classifyLabel;
@property(nonatomic,strong)UILabel *dateLabel;

@end

@implementation PostListOneImageCell

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
    _postImageView = [UIImageView new];
    _postImageView.backgroundColor = [UIColor whiteColor];
    _postImageView.contentMode = UIViewContentModeScaleAspectFit;
    _postImageView.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:_postImageView];
    
    _contentLabel = [UILabel new];
    _contentLabel.backgroundColor = [UIColor whiteColor];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.text = @"这个年代养老还得靠自己";
    _contentLabel.font = [UIFont systemFontOfSize:16.0];
    _contentLabel.numberOfLines = 2;
    [self.contentView addSubview:_contentLabel];
    
    _classifyLabel = [UILabel new];
    _classifyLabel.backgroundColor = [UIColor whiteColor];
    _classifyLabel.textColor = [UIColor grayColor];
    _classifyLabel.text = @"社区";
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
    [_postImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(80));
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.right.mas_equalTo(_postImageView.mas_left).offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
    }];
    
    [_classifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_postImageView.mas_left).offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

- (void)setOneImageModel
{
    // to do 赋值
}

@end
