//
//  ViewController.m
//  CBD
//
//  Created by crx on 2021/1/26.
//  Copyright © 2021 crx. All rights reserved.
//

#import "ViewController.h"
#import "RCFirstPublic.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    UIImage *image = [RCFirstPublic imageNamed:@"d3.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 50, 150)];
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [self.view addSubview:imageView];
    
    UIImage *image2 = [UIImage imageNamed:@"xk.jpeg"];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 50, 150)];
    imageView2.backgroundColor = [UIColor lightGrayColor];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = image2;
    [self.view addSubview:imageView2];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 50, 150)];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)gotoNext {
    UIViewController *vc = [RCFirstPublic aViewController];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
