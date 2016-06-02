//
//  PostThemeViewController.m
//  PostObject
//
//  Created by 廖智 on 16/5/30.
//  Copyright © 2016年 廖智. All rights reserved.
//

#import "PostThemeViewController.h"
#import "JJRefreshHeader.h"
#import "JJRefreshFooter.h"

#import "PostListBigImageCell.h"
#import "PostListNormalCell.h"
#import "PostListOneImageCell.h"
#import "PostListThreeImageCell.h"
#import "PostListThreeThemeCell.h"

@interface PostThemeViewController()
{
    JJRefreshHeader *refreshHeader;
    JJRefreshFooter *refreshFooter;
    NSMutableArray *jsonData;
}

@end

@implementation PostThemeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - tableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 100;
    }else if (indexPath.row == 1){
        return 80;
    }
    
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        PostListBigImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bigImage"];
        if (nil == cell) {
            cell = [[PostListBigImageCell alloc] init];
        }
        return cell;
    }else if (indexPath.row == 1){
        PostListThreeThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeTheme"];
        if (nil == cell) {
            cell = [[PostListThreeThemeCell alloc] init];
        }
        return cell;
    }else if (indexPath.row == 2 || indexPath.row == 3){
        PostListOneImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneImage"];
        if (nil == cell) {
            cell = [[PostListOneImageCell alloc] init];
        }
        return cell;
    }else if (indexPath.row == 4){
        PostListThreeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeImage"];
        if (nil == cell) {
            cell = [[PostListThreeImageCell alloc] init];
        }
        return cell;
    }else if (indexPath.row == 5){
        PostListNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normal"];
        if (nil == cell) {
            cell = [[PostListNormalCell alloc] init];
        }
        return cell;
    }
    
    PostListOneImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneImage"];
    if (nil == cell) {
        cell = [[PostListOneImageCell alloc] init];
    }
    return cell;
}
#pragma mark - tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//+ (instancetype)postsController{
//    return self;
//}

@end
