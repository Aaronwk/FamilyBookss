//
//  Home01_EntryTableView.m
//  FamilyBooks
//
//  Created by 王凯 on 16/2/26.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "Home01_EntryTableView.h"
#import "Home01_TableViewCell.h"

@implementation Home01_EntryTableView
{
//    NSArray *dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if(self){
        self.delegate = self;
        self.dataSource = self;
//        背景图片
//        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
//        [self setBackgroundView:bgImageView];
        
        
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Home01_TableViewCell";
    Home01_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = (Home01_TableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"Home01_TableViewCell" owner:self options:nil]  lastObject];
        
    }
     cell.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = _dataArray[indexPath.row];
    
    return cell;
}







@end
