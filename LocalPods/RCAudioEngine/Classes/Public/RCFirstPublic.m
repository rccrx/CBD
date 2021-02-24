//
//  RCFirstPublic.m
//  RCAudioEngine
//
//  Created by crx on 2021/2/22.
//

#import "RCFirstPublic.h"

@implementation RCFirstPublic

+ (NSBundle *)audioEngineBundle {
    NSBundle *aeBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"RCAudioEngine" ofType:@"bundle"]];
    return aeBundle;
}

+ (UIImage *)imageNamed:(NSString *)name {
    NSBundle *aeBundle = [RCFirstPublic audioEngineBundle];
    UIImage *image = [UIImage imageWithContentsOfFile:[aeBundle pathForResource:name ofType:nil]];
    return image;
}


+ (UIViewController *)aViewController {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    
    UIImage *image = [UIImage imageNamed:@"d3.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 50, 150)];
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [vc.view addSubview:imageView];
    
    UIImage *image2 = [RCFirstPublic imageNamed:@"d3.png"];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 50, 150)];
    imageView2.backgroundColor = [UIColor lightGrayColor];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = image2;
    [vc.view addSubview:imageView2];
    return vc;
}

@end
