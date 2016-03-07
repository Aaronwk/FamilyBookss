//
//  Home01_view.m
//  FamilyBooks
//
//  Created by 王凯 on 16/3/1.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "Home01_view.h"
#import "Home01_TableViewCell.h"

@implementation Home01_view
{
    NSArray *list;
}

+ (instancetype)shareInstance
{
    id object = [[[NSBundle mainBundle] loadNibNamed:@"Home01_view" owner:nil options:nil] objectAtIndex:0];

    return object;
}

- (void)awakeFromNib
{
    self.headerImageView.image = [UIImage imageNamed:@"tiao_green"];
    _headerImageView.layer.cornerRadius = 20;
    _headerImageView.layer.masksToBounds = YES;
    self.nameLabel.text = @"你是谁？";
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"我的QQ会员", @"QQ钱包",
                      @"个性装扮", @"我的收藏", @"我的相册", @"我的文件", nil];
    list = [NSArray arrayWithArray:array];
}
- (IBAction)personHeaderViewBtn:(id)sender {
    NSLog(@"更改头像");
}


//绑定数据源
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"Home01_TableViewCell";
    
    Home01_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = (Home01_TableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:TableSampleIdentifier owner:self options:nil]  lastObject];
    }
    
    NSUInteger row = [indexPath row];
    cell.titleLabel.text = list[row];
    cell.titleLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
//是否分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return list.count;
}

//响应点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"响应单击事件");
    NSString *index = [NSString stringWithFormat:@"%ld", indexPath.row];
    NSDictionary *dic = @{@"indexPath":index};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMainView"object:self userInfo:dic];
}



@end
