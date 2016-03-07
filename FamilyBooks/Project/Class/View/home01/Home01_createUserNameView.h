//
//  Home01_createUserNameView.h
//  FamilyBooks
//
//  Created by 王凯 on 16/2/29.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MyBlockName)(NSString *strName);

@interface Home01_createUserNameView : UIView

@property (nonatomic, copy) MyBlockName myBlockName;


- (void)myBlockName:(MyBlockName)myBlockName;

@end
