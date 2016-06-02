
//
//  PostModuleViewController.m
//  PostObject
//
//  Created by 廖智 on 16/5/21.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostModuleViewController.h"
#import "JJPostListBar.h"
#import "JJPostHeaderArrow.h"
#import "JJPostDetailsList.h"
#import "JJPostLabelDeleteView.h"
#import "JJPostScroller.h"
#import "JJPostDetailViewController.h"

#import "PostThemeViewController.h"

#define kListBarH 30
#define kArrowW 40
#define kAnimationTime 0.8

@interface PostModuleViewController()<UIScrollViewDelegate>

@property (nonatomic,strong) JJPostListBar *listBar;
@property (nonatomic,strong) JJPostLabelDeleteView *deleteBar;
@property (nonatomic,strong) JJPostDetailsList *detailsList;
@property (nonatomic,strong) JJPostHeaderArrow *arrow;
@property (nonatomic,strong) UIScrollView *mainScroller;

@end

@implementation PostModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setupNaviBar];
    [self makeContent];
}

-(void)setupNaviBar
{
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor grayColor];
     self.title = @"帖子";
}


-(void)makeContent
{
    NSMutableArray *listTop = [[NSMutableArray alloc] initWithArray:@[@"热点",@"推荐",@"热点啊",@"听说",@"你猜",@"无语",@"你说呢",@"无力"]];
//    NSMutableArray *listBottom = [[NSMutableArray alloc] initWithArray:@[@"美文",@"情感",@"语录",@"美图",@"房产",@"家居",@"搞笑",@"星座",@"文化",@"视频"]];
    
    __weak typeof(self) unself = self;
    
//    if (!self.detailsList) {
//        self.detailsList = [[JJPostDetailsList alloc] initWithFrame:CGRectMake(0, kListBarH-kScreenH, kScreenW, kScreenH-kListBarH)];
//        self.detailsList.listAll = [NSMutableArray arrayWithObjects:listTop,listBottom, nil];
//        self.detailsList.longPressedBlock = ^(){
//            [unself.deleteBar sortBtnClick:unself.deleteBar.sortBtn];
//        };
//        self.detailsList.opertionFromItemBlock = ^(animateType type, NSString *itemName, int index){
//            [unself.listBar operationFromBlock:type itemName:itemName index:index];
//        };
//        [self.view addSubview:self.detailsList];
//    }
    
    if (!self.listBar) {
        self.listBar = [[JJPostListBar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kListBarH)];
        self.listBar.visibleItemList = listTop;
        self.listBar.arrowChange = ^(){
            if (unself.arrow.arrowBtnClick) {
                unself.arrow.arrowBtnClick();
            }
        };
        self.listBar.listBarItemClickBlock = ^(NSString *itemName , NSInteger itemIndex){
            [unself.detailsList itemRespondFromListBarClickWithItemName:itemName];
            //添加scrollview
            
            //移动到该位置
            unself.mainScroller.contentOffset =  CGPointMake(itemIndex * unself.mainScroller.frame.size.width, 0);
        };
        [self.view addSubview:self.listBar];
    }
    
    if (!self.deleteBar) {
        self.deleteBar = [[JJPostLabelDeleteView alloc] initWithFrame:self.listBar.frame];
        [self.view addSubview:self.deleteBar];
    }
    
    
//    if (!self.arrow) {
//        self.arrow = [[JJPostHeaderArrow alloc] initWithFrame:CGRectMake(kScreenW-kArrowW, 0, kArrowW, kListBarH)];
//        self.arrow.arrowBtnClick = ^(){
//            unself.deleteBar.hidden = !unself.deleteBar.hidden;
//            [UIView animateWithDuration:kAnimationTime animations:^{
//                CGAffineTransform rotation = unself.arrow.imageView.transform;
//                unself.arrow.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
//                unself.detailsList.transform = (unself.detailsList.frame.origin.y<0)?CGAffineTransformMakeTranslation(0, kScreenH):CGAffineTransformMakeTranslation(0, -kScreenH);
//            }];
//        };
//        self.arrow.backgroundColor = RGBColor(238.0, 238.0, 238.0);
//        [self.view addSubview:self.arrow];
//    }
    
    if (!self.mainScroller) {
        self.mainScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kListBarH, kScreenW , kScreenH-kListBarH-64)];
        self.mainScroller.backgroundColor = [UIColor yellowColor];
        self.mainScroller.bounces = NO;
        self.mainScroller.pagingEnabled = YES;
        self.mainScroller.showsHorizontalScrollIndicator = NO;
        self.mainScroller.showsVerticalScrollIndicator = NO;
        self.mainScroller.delegate = self;
        self.mainScroller.contentSize = CGSizeMake(kScreenW*10,self.mainScroller.frame.size.height);
        [self.view insertSubview:self.mainScroller atIndex:0];
        
#pragma mark -  预加载、清除防止内存过大等操作暂时不做
        [self addScrollViewWithItemName:@"热点" index:0];
        [self addScrollViewWithItemName:@"推荐" index:1];
        [self addScrollViewWithItemName:@"das" index:2];
        [self addScrollViewWithItemName:@"阿萨德" index:3];
        [self addScrollViewWithItemName:@"大家" index:4];
        [self addScrollViewWithItemName:@"推我看见就" index:5];
    }
}

-(void)addScrollViewWithItemName:(NSString *)itemName index:(NSInteger)index{
    UIScrollView *scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(index * self.mainScroller.frame.size.width, 0, self.mainScroller.frame.size.width, self.mainScroller.frame.size.height)];
    scroller.backgroundColor = RGBColor(arc4random()%255, arc4random()%255, arc4random()%255);
    
    if ([itemName isEqualToString:@"热点"]) {
        PostThemeViewController *postVC = [[PostThemeViewController alloc] init];
       postVC.view.frame = CGRectMake(index * self.mainScroller.frame.size.width, 0, self.mainScroller.frame.size.width, self.mainScroller.frame.size.height);
        
       [self.mainScroller addSubview:postVC.view];
        
    }else{
    
    if ([itemName isEqualToString:@"推荐"]) {
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
        label.backgroundColor = [UIColor grayColor];
        label.text = itemName;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = [UIColor whiteColor];
        [scroller addSubview:label];
        
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitle:@"去详情" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }

    [self.mainScroller addSubview:scroller];
        
    }
}
- (void)btnClick:(UIButton *)sender
{
    JJPostDetailViewController *postDetailVC = [[JJPostDetailViewController alloc] init];
    [self.navigationController pushViewController:postDetailVC animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.listBar itemClickScrollWithIndex:scrollView.contentOffset.x / self.mainScroller.frame.size.width];
}

@end
