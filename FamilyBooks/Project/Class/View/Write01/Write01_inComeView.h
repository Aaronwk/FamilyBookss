//
//  Write01_inComeView.h
//  FamilyBooks
//
//  Created by 王凯 on 16/3/4.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Write01_inComeView : UIView

@property (weak, nonatomic) IBOutlet UISegmentedControl *seguiment;
@property (weak, nonatomic) IBOutlet UIView *inComeView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *inputLabel;

+ (instancetype)shareInstance;

@end
