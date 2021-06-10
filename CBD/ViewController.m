//
//  ViewController.m
//  CBD
//
//  Created by crx on 2021/1/26.
//  Copyright © 2021 crx. All rights reserved.
//

#import "ViewController.h"
#import "RCLiveModule-Swift.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

/** 获取tableView的行数、标题、点击行为；
 *  tag=0获取行数，需要传入count接收结果；
 *  1获取标题，需要传入title接收结果，index表示哪一行；
 *  2执行点击事件，index表示哪一行。 */
- (void)tableViewDataSourceAndSelectedActionWithTag:(NSInteger)tag count:(NSInteger *)count index:(NSInteger)index title:(NSString **)title {
    if (tag == 0) {
        *count = 1;
        return;
    }
    
    if (index == 0) {
        if (tag == 1) {
            *title = @"跳转到直播页面";
        } else if (tag == 2) {
            UIViewController *liveVC = [RCLiveModulePublic createLiveViewController];
            [self.navigationController pushViewController:liveVC animated:YES];
//            [self presentViewController:liveVC animated:YES completion:nil];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"首页";
    
    NSArray *allScenes = [UIApplication sharedApplication].connectedScenes.allObjects;
    UIWindowScene *scene = allScenes.count>0 ? allScenes.firstObject : nil;
    
    CGRect statusBarFrame = scene.statusBarManager.statusBarFrame;
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    CGFloat tableViewY = CGRectGetHeight(statusBarFrame) + CGRectGetHeight(navigationBarFrame);
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, CGRectGetWidth(UIScreen.mainScreen.bounds), CGRectGetHeight(UIScreen.mainScreen.bounds)-tableViewY) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - tableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    [self tableViewDataSourceAndSelectedActionWithTag:0 count:&count index:0 title:nil];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = nil;
    [self tableViewDataSourceAndSelectedActionWithTag:1 count:nil index:indexPath.row title:&title];
    NSString *reuseIdentifier = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self tableViewDataSourceAndSelectedActionWithTag:2 count:nil index:indexPath.row title:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
