//
//  Home01_model.m
//  FamilyBooks
//
//  Created by 王凯 on 16/2/27.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "Home01_model.h"

@implementation Home01_model

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"小岩岩账单-零食"]){
        _one = value;
    }
    if([key isEqualToString:@"小岩岩账单-服饰"]){
        _two = value;
    }
    if([key isEqualToString:@"小岩岩账单-饮食"]){
        _three = value;
    }
    if([key isEqualToString:@"小岩岩账单-箱包"]){
        _four = value;
    }
    if([key isEqualToString:@"小岩岩账单-零花钱"]){
        _five = value;
    }
    
}

@end
