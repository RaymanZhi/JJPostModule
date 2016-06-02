//
//  PostListNormalCell.m
//  PostObject
//
//  Created by 廖智 on 16/5/31.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostListNormalCell.h"
#import "Masonry.h"

@interface PostListNormalCell()

@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *classifyLabel;
@property(nonatomic,strong)UILabel *dateLabel;

@end

@implementation PostListNormalCell

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
    _contentLabel = [UILabel new];
    _contentLabel.backgroundColor = [UIColor whiteColor];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.font = [UIFont systemFontOfSize:16.0];
    _contentLabel.numberOfLines = 2;
    _contentLabel.text = @"既然不是仙，难免有杂念，终日奔波苦，一日不得闲。";
    [self.contentView addSubview:_contentLabel];
    
    _classifyLabel = [UILabel new];
    _classifyLabel.backgroundColor = [UIColor whiteColor];
    _classifyLabel.textColor = [UIColor grayColor];
    _classifyLabel.font = [UIFont systemFontOfSize:14.0];
    _classifyLabel.text = @"专家";
    [self.contentView addSubview:_classifyLabel];
    
    _dateLabel = [UILabel new];
    _dateLabel.backgroundColor = [UIColor whiteColor];
    _dateLabel.textColor = [UIColor grayColor];
    _dateLabel.font = [UIFont systemFontOfSize:14.0];
    _dateLabel.text = @"刚刚";
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
    
    [_classifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

- (void)setNormalModel
{
    // to do  赋值
    
    
}

//- (CGSize)contentString:(NSString *)contentString sizeOfFont:(UIFont *)font textMaxSize:(CGSize)maxSize{
//    
//    return  [contentString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
//}

@end
