//
//  DBApi.m
//  PSPTWallet
//
//  Created by YuboZhou on 2018/11/7.
//  Copyright © 2018 Passport. All rights reserved.
//

#import "DBApi.h"

@implementation DBApi

+ (void)createAllTable {
    
    [WalletDBManager createWalletTable];
}

+ (void)deleteAllDataInfo {
    
    [WalletDBManager deleteWalletTable];
}

#pragma mark-Wallet Api
+ (BOOL)walletAddRecord:(WalletModel *)model {
    
    return [WalletDBManager addRecord:model];
}

+ (BOOL)walletDeleteRecord:(NSString *)wallet_address {
    
    return [WalletDBManager deleteRecord:wallet_address];
}

+ (NSMutableArray<WalletModel *> *)walletSelectAllLocalWallet {
    
    return [WalletDBManager selectAllLocalWallet];
}

+ (NSMutableArray<WalletModel *> *)walletSelectCurrentWallet:(NSString *)wallet_address {
    
    return [WalletDBManager selectCurrentWallet:wallet_address];
}

+ (BOOL)walletExecuteUpdate:(NSString *)sqlString {
    
    return [WalletDBManager executeUpdate:sqlString];
}

@end
