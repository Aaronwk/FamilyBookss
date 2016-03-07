//
//  WK_DatabaseManager.m
//  FamilyBooks
//
//  Created by 王凯 on 16/2/29.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "WK_DatabaseManager.h"
#import "HeaderForGlobal.h"

@implementation WK_DatabaseManager
{
    NSString *createPath;
}


+(WK_DatabaseManager *)shareInstance
{
    static WK_DatabaseManager *defaultHandel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultHandel = [[WK_DatabaseManager alloc] init];
    });
    return defaultHandel;
}

static FMDatabase *db = nil;

/**
 *  打开数据库 - string
 */
- (void)opendb
{
    if(db == nil){
        NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *dbPath = [pathDocuments stringByAppendingPathComponent:@"DatabasePerson.db"];
        db = [FMDatabase databaseWithPath:dbPath] ;
        if ([db open]) {
            NSLog(@"db打开成功");
            [db executeUpdate:@"CREATE TABLE dataList (tableName text primary key not null, type text, itemName text, itemCount text, price text)"];
            NSLog(@"db创建表成功");
        }else{
            NSLog(@"Could not open db.");
        }
    }
}

/** 获取用户目录路径-暂时弃用 */
- (void)getuserPath:(NSString *)userID
{
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *userPath = [NSString stringWithFormat:@"%@/%@", pathDocuments, userID];
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:userPath]) {
        
    } else {
        createPath = userPath;
    }
}

/** 创建用户根目录-暂时弃用 */
- (void)createUserDatabase:(NSString *)userID
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    createPath = [NSString stringWithFormat:@"%@/%@", pathDocuments, userID];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
    NSLog(@"文件件路径：%@", createPath);
}

/**
 *  插入数据
 *
 *  @param tableName 表名称
 *  @param type      类型
 *  @param itemName  商品名称
 *  @param itemCount 商品数量
 *  @param price     商品单价
 */
- (void)insertDataBaseWithTableName:(NSString *)tableName type:(NSString *)type itemName:(NSString *)itemName itemCount:(NSString *)itemCount price:(NSString *)price
{
    [db executeUpdate:@"INSERT INTO dataList (tableName, type, itemName, itemCount, price)VALUES(?, ?, ?, ?, ?)", tableName, type, itemName, itemCount, price];
}
/**
 *  判断表名是否存在-暂时弃用
 *
 *  @param tableName 表名称
 *
 *  @return bool
 */
- (BOOL) isTableOK:(NSString *)tableName
{
    FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        NSLog(@"isTableOK %ld", (long)count);
        
        if (0 == count)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    
    return NO;
}


@end
