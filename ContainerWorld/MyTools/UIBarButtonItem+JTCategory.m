//
//  UIBarButtonItem+JTCategory.m
//  Container
//
//  Created by JoyTomi on 16/4/14.
//  Copyright © 2016年 JoyTomi. All rights reserved.
//

#import "UIBarButtonItem+JTCategory.h"
#import "NSString+FontAwesome.h"

@implementation UIBarButtonItem (JTCategory)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    //创建按钮
    UIButton *button =[[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame =CGRectMake(0, 0, 60, 60);
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
+(UIBarButtonItem *)itemWithTitle:(NSString *)name target:(id)target action:(SEL)action{
    //创建按钮
    UIButton *button =[[UIButton alloc] init];
    [button setTitle:name forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame =CGRectMake(0, 0, 60, 60);
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+(UIBarButtonItem *)itemWithTitle:(NSString *)name size:(CGFloat)size target:(id)target action:(SEL)action{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:size];
    [button setTitle:name forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame =CGRectMake(0, 0, 60, 60);
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}


@end
