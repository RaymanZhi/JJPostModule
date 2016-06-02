//
//  PostThemeViewController.h
//  PostObject
//
//  Created by 廖智 on 16/5/30.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostThemeViewController : UITableViewController

@property(nonatomic,copy)NSString *themeId;
@property(nonatomic,copy)NSString *themeName;
@property(nonatomic,copy)NSString* themeChannelUrl;

//+ (instancetype)postsController;

@end
