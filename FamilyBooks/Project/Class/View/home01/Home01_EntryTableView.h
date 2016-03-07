//
//  Home01_EntryTableView.h
//  FamilyBooks
//
//  Created by 王凯 on 16/2/26.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home01_EntryTableView : UITableView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
