//
//  JJPostDetailViewController.m
//  PostObject
//
//  Created by 廖智 on 16/5/23.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "JJPostDetailViewController.h"
#import <WebKit/WebKit.h>
#import "Masonry.h"
#import "PostMacro.h"
#import "JJNavDropdownMenuView.h"

@interface JJPostDetailViewController()<WKNavigationDelegate>

@property(nonatomic,strong)WKWebView *postWebView;

@end

@implementation JJPostDetailViewController

- (void)viewDidLoad
{
    
    [self setupNaviBar];
    [self createNavItem];
    [self createView];
}
-(void)setupNaviBar
{
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor grayColor];
    self.title = @"帖子详情";
}

- (void)createNavItem
{
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick:)
         forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0 , 0, 60, 30);
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = menuButton;
    
//    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//     [rightButton setTitle:@"详情" forState:UIControlStateNormal];
//    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:17.0]];
//    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [rightButton addTarget:self action:@selector(rightBtnCilck:)
//          forControlEvents:UIControlEventTouchUpInside];
//    rightButton.frame = CGRectMake(0 , 0, 60, 30);
//    UIBarButtonItem *menuBtn = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//    self.navigationItem.rightBarButtonItem = menuBtn;
    [self rightBtn];
}

- (void)createView
{
    _postWebView = [[WKWebView alloc] initWithFrame:CGRectZero];
    _postWebView.backgroundColor = [UIColor whiteColor];
    _postWebView.navigationDelegate = self;
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.baidu.com"];
    [_postWebView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
    [self.view addSubview:_postWebView];
    
    [self makeConstraints];
}
- (void)makeConstraints
{
    [_postWebView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(self.view.mas_left);
           make.right.mas_equalTo(self.view.mas_right);
           make.top.mas_equalTo(self.view.mas_top);
           make.bottom.mas_equalTo(self.view.mas_bottom);
      }];
}
#pragma mark - wkwebviewdelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation //页面开始加载调用
{
    
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation //内容开始返回时调用
{
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation //页面加载完调用
{
    
}

#pragma mark - 自定义方法
- (void)leftBtnClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtn
{
    __weak typeof(self) weakSelf = self;
    JJNavDropdownItem *item0 = [JJNavDropdownItem itemWithTitle:@"Item0" iconName:@"" callBack:^(NSUInteger index, id info) {
        [weakSelf push];
    }];
    JJNavDropdownItem *item1 = [JJNavDropdownItem itemWithTitle:@"Item1" iconName:@"" callBack:^(NSUInteger index, id info) {
        [weakSelf push];
    }];
    JJNavDropdownItem *item2 = [JJNavDropdownItem itemWithTitle:@"Item2" iconName:@"" callBack:^(NSUInteger index, id info) {
        [weakSelf push];
    }];
    JJNavDropdownItem *item3 = [JJNavDropdownItem itemWithTitle:@"Item3" iconName:@"" callBack:^(NSUInteger index, id info) {
        [weakSelf push];
    }];
    JJNavDropdownMenuView *menuView = [JJNavDropdownMenuView dropdownMenuViewWithType:dropDownTypeRightItem frame:CGRectMake(0, 0, 44.f, 44.f) dropdownTtems:@[item0,item1,item2,item3] icon:@"icon_score"];
    
    menuView.dropWidth = 100.f;
    menuView.titleFont = [UIFont systemFontOfSize:18.f];
    menuView.textColor = RGBColor(102.f, 102.f, 102.f);
    menuView.textFont = [UIFont systemFontOfSize:13.f];
    menuView.cellSeparatorColor = RGBColor(222.f, 223.f, 224.f);
    menuView.textFont = [UIFont systemFontOfSize:14.f];
    menuView.animationDuration = 0.2f;
    menuView.backgroundAlpha = 0.1;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:menuView];
}

- (void)push
{
   
}

@end
 
 
 
 
 
 
 
 
 
