//
//  DBApi.h
//  PSPTWallet
//
//  Created by YuboZhou on 2018/11/7.
//  Copyright © 2018 Passport. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletDBManager.h"
#import "WalletModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBApi : NSObject

#pragma mark -创建/删除所有数据表

//创建所有数据表
+ (void)createAllTable;
//删除所有数据表
+ (void)deleteAllDataInfo;

#pragma mark-Wallet Api
+ (BOOL)walletAddRecord:(WalletModel *)model;
+ (BOOL)walletDeleteRecord:(NSString *)wallet_address;
+ (NSMutableArray<WalletModel *> *)walletSelectAllLocalWallet;
+ (NSMutableArray<WalletModel *> *)walletSelectCurrentWallet:(NSString *)wallet_address;
+ (BOOL)walletExecuteUpdate:(NSString *)sqlString;

@end

NS_ASSUME_NONNULL_END
