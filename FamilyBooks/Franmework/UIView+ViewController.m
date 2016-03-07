//
//  UIView+ViewController.m
//  KGY_Project
//
//  Created by w on 15/9/5.
//  Copyright (c) 2015年 uncle cow. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    id next = [self nextResponder];
    while (next) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return next;
        }
        next = [next nextResponder];
    }
    return nil;
}

@end
