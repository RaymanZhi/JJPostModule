//
//  JJNavDropdownMenuView.h
//  PostObject
//
//  Created by 廖智 on 16/5/24.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dropMenuCallBack)(NSUInteger index,id info);

typedef enum : NSUInteger {
    dropDownTypeTitle = 0,
    dropDownTypeLeftItem = 1,
    dropDownTypeRightItem = 2,
} NAVDropDownType;

@interface JJNavDropdownMenuView : UIView

+ (instancetype)dropdownMenuViewWithType:(NAVDropDownType)dropDownType frame:(CGRect)frame dropdownTtems:(NSArray *)dropdownItems icon:(NSString *)icon;
+ (instancetype)dropdownMenuViewForNavbarTitleViewFrame:(CGRect)frame dropdownItems:(NSArray *)dropdownItems;

@property(nonatomic,weak)UINavigationController *currentNav;
@property(nonatomic,assign)NSUInteger selectedIndex;
@property(nonatomic,strong)UIColor *titleColor;
@property(nonatomic,strong)UIFont *titleFont;

//下拉菜单 属性
@property(nonatomic,assign)CGFloat dropWidth; //下拉高度 默认80
@property(nonatomic,strong)UIColor *cellColor;
@property(nonatomic,strong)UIColor *textColor;
@property(nonatomic,strong)UIFont *textFont;
@property(nonatomic,strong)UIColor *cellSeparatorColor;
@property(nonatomic,strong)UIColor *cellAccessoryCheckmarkColor;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGFloat animationDuration;
@property(nonatomic,assign)BOOL showAccessoryCheckmark; //下拉cell 是否显示选择按钮
@property(nonatomic,assign)CGFloat backgroundAlpha;

@end




@interface JJNavDropdownItem : NSObject

@property(nonatomic,copy)dropMenuCallBack callBack;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *iconName;
@property(nonatomic,assign)BOOL isSelected;
@property(nonatomic,strong) id info;

+ (instancetype)itemWithTitle:(NSString *)title iconName:(NSString *)iconName callBack:(dropMenuCallBack)callBack;
+ (instancetype)itemWithTitle:(NSString *)title callBack:(dropMenuCallBack)callBack;
+ (instancetype)Item;

@end


