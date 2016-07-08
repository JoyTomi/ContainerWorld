//
//  UIBarButtonItem+JTCategory.h
//  Container
//
//  Created by JoyTomi on 16/4/14.
//  Copyright © 2016年 JoyTomi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JTCategory)
//只能添加方法
+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
+(UIBarButtonItem *)itemWithTitle:(NSString *)name target:(id)target action:(SEL)action;
+(UIBarButtonItem *)itemWithTitle:(NSString *)name size:(CGFloat)size target:(id)target action:(SEL)action;
@end
