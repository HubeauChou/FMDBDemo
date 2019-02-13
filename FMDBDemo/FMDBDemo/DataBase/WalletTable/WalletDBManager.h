//
//  WalletDBManager.h
//  HandyWalletDemo
//
//  Created by YuboZhou on 2018/9/19.
//  Copyright © 2018年 Passport. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Database.h"
#import "WalletModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WalletDBManager : NSObject

+ (void)createWalletTable;

+ (void)deleteWalletTable;

/**
 添加记录
 */
+ (BOOL)addRecord:(WalletModel *)model;

/**
 删除钱包
 */
+ (BOOL)deleteRecord:(NSString *)wallet_address;

/**
 查询所有钱包
 */
+ (NSMutableArray<WalletModel *> *)selectAllLocalWallet;

/**
 查询当前钱包信息
 */
+ (NSMutableArray<WalletModel *> *)selectCurrentWallet:(NSString *)wallet_address;

/**
 执行 sql 语句
 执行更新：
 
 在FMDB中，除查询以外的所有操作，都称为“更新”
 
 create、drop、insert、update、delete等
 
 使用executeUpdate:方法执行更新
 
 */
+ (BOOL)executeUpdate:(NSString *)sqlString;

/**
 给表增加新的字段
 
 @param name 字段名
 @param type 字段类型 INTEGER TEXT等
 */
+ (BOOL)addNewExists:(NSString *)name type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
