//
//  WK_DatabaseManager.h
//  FamilyBooks
//
//  Created by 王凯 on 16/2/29.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WK_DatabaseManager : NSObject

+(WK_DatabaseManager *)shareInstance;
- (void)opendb;
/** 创建用户根目录-暂时弃用 */
- (void)createUserDatabase:(NSString *)userID;

/** 获取用户目录路径-暂时弃用 */
- (void)getuserPath:(NSString *)userID;
/**
 *  插入数据
 *
 *  @param tableName 表名称
 *  @param type      类型
 *  @param itemName  商品名称
 *  @param itemCount 商品数量
 *  @param price     商品单价
 */
- (void)insertDataBaseWithTableName:(NSString *)tableName type:(NSString *)type itemName:(NSString *)itemName itemCount:(NSString *)itemCount price:(NSString *)price;

@end
