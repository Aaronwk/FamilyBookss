//
//  Home02_view.h
//  FamilyBooks
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home02_view : UIView
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
/** 支出 */
@property (weak, nonatomic) IBOutlet UILabel *expenditure;
/** 收入 */
@property (weak, nonatomic) IBOutlet UILabel *income;
/** 结余 */
@property (weak, nonatomic) IBOutlet UILabel *Balance;
/** 月份 */
@property (weak, nonatomic) IBOutlet UILabel *month;
/** 天 */
@property (weak, nonatomic) IBOutlet UILabel *day;
/** 状态 */
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *name;
/** 收入状态图 */
@property (weak, nonatomic) IBOutlet UIView *incomeView;
/** 支出状态图 */
@property (weak, nonatomic) IBOutlet UIView *expenditureView;
/** 结余状态图 */
@property (weak, nonatomic) IBOutlet UIView *balanceView;


+ (instancetype)shareInstance;

@end
