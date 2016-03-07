//
//  Home01_view.h
//  FamilyBooks
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home01_view : UIView

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
+ (instancetype)shareInstance;
@end
