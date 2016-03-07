//
//  WKDrawerViewController.h
//  抽屉demo
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKDrawerViewController : UIViewController

/**
 *  左视图
 */
@property (nonatomic, strong) UIView *leftView;
/**
 *  右视图
 */
@property (nonatomic, strong) UIView *rightView;

/**
 *  左抽屉视图单利
 *
 *  @return
 */
//+(WKDrawerView *)shareInstance;
/**
 *  返回到主界面
 */
- (void)backMainView;
/**
 *  弹出抽屉
 */
- (void)changeMainView;

@end
