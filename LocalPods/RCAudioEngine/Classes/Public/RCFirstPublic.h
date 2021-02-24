//
//  RCFirstPublic.h
//  RCAudioEngine
//
//  Created by crx on 2021/2/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCFirstPublic : NSObject

+ (NSBundle *)audioEngineBundle;
+ (UIImage *)imageNamed:(NSString *)name;

+ (UIViewController *)aViewController;

@end

NS_ASSUME_NONNULL_END
