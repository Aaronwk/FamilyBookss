//
//  Home02_view.m
//  FamilyBooks
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//


#define DEFULAT_ONE_X 90
#define DEFULAT_TWO_X 180
#define DEFULAT_THREE_X 270

#define DEFULAT_Y 510


#import "Home02_view.h"
#import "HeaderForGlobal.h"
#import "Write_ViewController.h"

@implementation Home02_view


+ (instancetype)shareInstance
{
    id object = [[[NSBundle mainBundle] loadNibNamed:@"Home02_view" owner:nil options:nil] objectAtIndex:0];
    
    return object;
}

- (void)awakeFromNib
{
    self.frame = CGRectMake(0, 0, K_WIDTH, K_HEIGHT);
    
    self.headerImage.image = [UIImage imageNamed:@"tiao_blue"];
    self.headerImage.layer.cornerRadius = 15;
    self.headerImage.layer.masksToBounds = YES;
    
    self.expenditure.text = @"40000.00";
    self.income.text = @"60000.00";
    self.Balance.text = @"20000.00";
    
    self.month.text = @"3月";
    self.day.text = @"2日";
    
    
    CGFloat ex = [_expenditure.text floatValue]/200;
    CGFloat inCome = [_income.text floatValue]/200;
    CGFloat ba = [_Balance.text floatValue]/200;
    
    self.incomeView.frame = CGRectMake(DEFULAT_ONE_X, DEFULAT_Y-inCome, 57, inCome);
    self.expenditureView.frame = CGRectMake(DEFULAT_TWO_X, DEFULAT_Y-ex, 57, ex);
    self.balanceView.frame = CGRectMake(DEFULAT_THREE_X, DEFULAT_Y-ba, 57, ba);
    
    
    
    
    
}


- (IBAction)leftViewBtn:(id)sender {
    NSLog(@"zushiti");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMainView"object:self userInfo:@{@"surport":[NSNumber numberWithBool:YES]}];
//    self.viewController 
}

- (IBAction)addAction:(id)sender {
    NSLog(@"添加记事本");
    
    NSArray *arr = @[@"又没钱了", @"真的没了", @"不能再花了", @"再少花一点", @"再花一点点"];
    
    self.status.text = arr[arc4random() % 5];
    Write_ViewController *write = [[Write_ViewController alloc] init];
    
    [self.viewController presentViewController:write animated:YES completion:^{
        
    }];
}



//- (instancetype)shareInstance
//{
//    id object = [[[NSBundle mainBundle] loadNibNamed:@"Home02_view" owner:nil options:nil] objectAtIndex:0];
//    
//    return object;
//}


@end
