//
//  WalletModel.m
//  HandyWalletDemo
//
//  Created by YuboZhou on 2018/9/19.
//  Copyright © 2018年 Passport. All rights reserved.
//

#import "WalletModel.h"

#define IsNilOrNull(_ref) (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:[NSNull class]]))
#define VALIDATE_STRING(str) (IsNilOrNull(str) ? @"" : str)

@implementation WalletModel

- (void)parseFromSet:(FMResultSet *)resultSet {
    
    self.ID = VALIDATE_STRING([resultSet stringForColumn:@"ID"]);
    self.wallet_nickName = VALIDATE_STRING([resultSet stringForColumn:@"wallet_nickName"]);
    self.wallet_pwd = VALIDATE_STRING([resultSet stringForColumn:@"wallet_pwd"]);
    self.wallet_address = VALIDATE_STRING([resultSet stringForColumn:@"wallet_address"]);
    self.wallet_keyStore = VALIDATE_STRING([resultSet stringForColumn:@"wallet_keyStore"]);
    self.wallet_mnemonicPhrase = VALIDATE_STRING([resultSet stringForColumn:@"wallet_mnemonicPhrase"]);
    self.wallet_privateKey = VALIDATE_STRING([resultSet stringForColumn:@"wallet_privateKey"]);
    self.wallet_type = [resultSet intForColumn:@"wallet_type"];
}

@end
