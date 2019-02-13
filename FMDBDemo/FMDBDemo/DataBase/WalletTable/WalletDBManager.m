//
//  WalletDBManager.m
//  HandyWalletDemo
//
//  Created by YuboZhou on 2018/9/19.
//  Copyright © 2018年 Passport. All rights reserved.
//

#import "WalletDBManager.h"

@implementation WalletDBManager

+ (void)createWalletTable {
    
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            if (![db tableExists:Wallet_TABLE]) {
                NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@('ID' INTEGER PRIMARY KEY AUTOINCREMENT, wallet_nickName TEXT NOT NULL,wallet_pwd TEXT NOT NULL ,wallet_address TEXT NOT NULL, wallet_keyStore TEXT NOT NULL, wallet_mnemonicPhrase TEXT NOT NULL,wallet_privateKey TEXT NOT NULL, wallet_balance TEXT NOT NULL, wallet_type INT NOT NULL, wallet_status INT NOT NULL)", Wallet_TABLE];
                BOOL success = [db executeUpdate:sql];
                NSLog(@"创建---%@--%@",Wallet_TABLE,success?@"成功":@"失败");
            }
            [db close];
        }
    }];
}

+ (void)deleteWalletTable {
    
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString *sql = [NSString stringWithFormat:@"delete from %@",Wallet_TABLE];
            BOOL success = [db executeUpdate:sql];
            NSLog(@"删除所有数据---%@--%@",Wallet_TABLE,success?@"成功":@"失败");
            [db close];
        }
    }];
}

+ (BOOL)addRecord:(WalletModel *)model {
    
    // 去重
    if ([self selectCurrentWallet:model.wallet_address].count != 0) {
        
        return NO;
    }
    
    __block BOOL success = NO;
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            
            NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (wallet_nickName, wallet_pwd , wallet_address, wallet_keyStore, wallet_mnemonicPhrase ,wallet_privateKey, wallet_balance, wallet_type, wallet_status) VALUES  ('%@', '%@','%@' ,'%@','%@','%@','%@','%ld','%ld')", Wallet_TABLE, model.wallet_nickName, model.wallet_pwd,  model.wallet_address, model.wallet_keyStore , model.wallet_mnemonicPhrase , model.wallet_privateKey,model.wallet_balance,(long)model.wallet_type,model.wallet_status];
            success = [db executeUpdate:sql];
            NSLog(@"插入---%@--%@",Wallet_TABLE,success?@"成功":@"失败");
            
            [db close];
        }
    }];
    
    return success;
}

+ (BOOL)deleteRecord:(NSString *)wallet_address {
    
    __block BOOL success = NO;
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString *sql = [NSString stringWithFormat: @"DELETE FROM %@ WHERE wallet_address = ('%@')" , Wallet_TABLE, wallet_address];
            success = [db executeUpdate:sql];
            NSLog(@"删除指定数据---%@--%@",wallet_address,success?@"成功":@"失败");
            
            [db close];
        }
    }];
    
    return success;
}

+ (NSMutableArray<WalletModel *> *)selectAllLocalWallet {
    
    NSMutableArray *walletArr = [NSMutableArray array];
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString *sql = [NSString stringWithFormat:@"SELECT * FROM '%@'", Wallet_TABLE];
            FMResultSet *resultSet = [db executeQuery:sql];
            while([resultSet next]) {
                
                WalletModel *wallet = [[WalletModel alloc] init];
                [wallet parseFromSet:resultSet];
                if (wallet) {
                    [walletArr addObject:wallet];
                }
            }
            [db close];
        }
    }];
    
    return walletArr;
}

+ (NSMutableArray<WalletModel *> *)selectCurrentWallet:(NSString *)wallet_address {
    
    NSMutableArray *walletArr = [NSMutableArray array];
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE wallet_address = '%@'", Wallet_TABLE, wallet_address];
            FMResultSet *resultSet = [db executeQuery:sql];
            while([resultSet next]) {
                
                WalletModel *wallet = [[WalletModel alloc] init];
                [wallet parseFromSet:resultSet];
                if (wallet) {
                    [walletArr addObject:wallet];
                }
            }
            [db close];
        }
    }];
    
    return walletArr;
}


+ (BOOL)executeUpdate:(NSString *)sqlString {
    
    __block BOOL success = NO;
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            NSString *sql = sqlString;
            success = [db executeUpdate:sql];
            [db close];
        }
    }];
    
    return success;
}

+ (BOOL)addNewExists:(NSString *)name type:(NSString *)type {
    
    __block BOOL success = NO;
    [DataBase.dbQueue inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            
            if (![db columnExists:name inTableWithName:Wallet_TABLE]){
                
                NSString *alertStr = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ %@",Wallet_TABLE, name, type];
                BOOL worked = [db executeUpdate:alertStr];
                if(worked){
                    NSLog(@"插入字段成功");
                }else{
                    NSLog(@"插入字段失败");
                }
                
                success = worked;
            }
            
            [db close];
        }
    }];
    
    return success;
}

@end
