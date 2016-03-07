//
//  Write01_inComeView.m
//  FamilyBooks
//
//  Created by 王凯 on 16/3/4.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "Write01_inComeView.h"
#import "HeaderForGlobal.h"

@implementation Write01_inComeView
{
    UIView *expanceView;
    UILabel *titleLabel_ex;
    UILabel *inputLabel_ex;
}

+ (instancetype)shareInstance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"Write01_inComeView" owner:nil options:nil] objectAtIndex:0];
}


- (void)awakeFromNib
{
    self.seguiment.selectedSegmentIndex = 0;
    
    [self addBtn:self.inComeView];
    
    self.inputLabel.adjustsFontSizeToFitWidth = YES;
    self.inputLabel.text = @"999999999999";
    
    [self createExpanceView];
    
    
    
    
    
    [self bringSubviewToFront:self.inComeView];
    
    
}



- (void)createExpanceView
{
    expanceView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, K_WIDTH, K_HEIGHT)];
    expanceView.backgroundColor = [UIColor redColor];
    [self addSubview:expanceView];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_WIDTH, 64)];
    topView.backgroundColor = [UIColor colorWithRed:0.199 green:0.213 blue:0.213 alpha:1.000];
    [expanceView addSubview:topView];
    
    titleLabel_ex = [[UILabel alloc] initWithFrame:CGRectMake(15, topView.center.y-20, 80, 40)];
    titleLabel_ex.text = @"代码代码";
    titleLabel_ex.textColor = [UIColor whiteColor];
    [topView addSubview:titleLabel_ex];
    
    inputLabel_ex = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel_ex.right+30, topView.center.y-20, K_WIDTH-(titleLabel_ex.right+30)-15, 40)];
    inputLabel_ex.textColor = [UIColor redColor];
    inputLabel_ex.text = @"1000000000000.00";
    inputLabel_ex.font = [UIFont systemFontOfSize:21];
    inputLabel_ex.textAlignment = NSTextAlignmentRight;
    [topView addSubview:inputLabel_ex];
}

- (IBAction)deleteBtn:(id)sender {
    
}
- (IBAction)seguiment:(id)sender {
    
    NSInteger index = [sender selectedSegmentIndex];
    
    if(index == 0){
        NSLog(@"收入");
        [self bringSubviewToFront:self.inComeView];
    }else{
        NSLog(@"支出");
        [self bringSubviewToFront:expanceView];
    }
}


- (void)addBtn:(UIView *)view
{
    
//    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"一条大河", @"二条大河", @"三条大河", @"四条大河", @"五条大河", @"六条大河", @"七条大河", @"八条大河", nil];
//    
//    for (int i = 0; i < array.count; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setTitle:array[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [view addSubview:button];
//        
//        
//        button.backgroundColor = [UIColor orangeColor];
//        
////        int row = (int)array.count /4;
//        
//        int b = 0;
//        
//        if(i%4==0){
//            b = i;
//            NSLog(@"==%d", b);
//        }
//        
//        if(i>b){
//            NSLog(@"%d  %d", i, b);
//            button.frame = CGRectMake(15+((K_WIDTH-70)/4+10)*(i-b), 150+(40*b/4+10), (K_WIDTH-60)/4, 40);
//        }else{
//            button.frame = CGRectMake(15+((K_WIDTH-70)/4+10)*i, 150, (K_WIDTH-60)/4, 40);
//        }
//        
//        
//        
//        
//    }
    
    
    
    NSArray *array = @[@[@"全部订单", @"机票", @"机场餐饮", @"机场餐饮"], @[@"机场零售", @"机场免税", @"贵宾服务", @"机场餐饮"], @[@"邮寄服务", @"本地餐饮", @"本地特产", @"机场餐饮"], @[@"酒店", @"租车", @"旅游", @"机场餐饮"]];
    
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10 + ((K_WIDTH - 30) / 4) * j + 5, 100 + 45 * i, (K_WIDTH - 30) / 4 - 5, 35)];
            button.tag = 4 * i + j + 100;
            button.backgroundColor = [UIColor whiteColor];
            [button addTarget:self action:@selector(buttonAcrion:) forControlEvents:UIControlEventTouchUpInside];
            NSString *str = [[array objectAtIndex:i] objectAtIndex:j];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [button setTitleColor:kUIColorFromRGB(0xdb2f2f) forState:UIControlStateSelected];
            [button setBackgroundImage:[UIImage imageNamed:@"qufukuankuang"] forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitle:str forState:UIControlStateNormal];
            [view addSubview:button];
            NSLog(@"%ld", (long)button.tag);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



- (void)buttonAcrion:(UIButton *)button
{
    
}






@end
