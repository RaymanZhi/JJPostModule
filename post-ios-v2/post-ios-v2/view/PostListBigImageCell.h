//
//  PostListBigImageCell.h
//  PostObject
//
//  Created by 廖智 on 16/5/31.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BigImageCellModel;

typedef enum {
    
    PostListCellTypeNormal, //正常显示 无图
    PostListCellTypeBigImage,  //大图展示
    PostListCellTypeOneImage,  //一张图展示
    PostListCellTypeThreeImage //三张图片展示
    
}PostListCellType;

@interface PostListBigImageCell : UITableViewCell

@property(nonatomic,strong)BigImageCellModel *cellModel;

@end
