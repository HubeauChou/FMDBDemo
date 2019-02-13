//
//  WalletModel.h
//  HandyWalletDemo
//
//  Created by YuboZhou on 2018/9/19.
//  Copyright © 2018年 Passport. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WalletType) {
    pspt_wallet = 0,
    eth_wallet = 1,
    btc_wallet = 2
};

typedef NS_ENUM(NSInteger, WalletStatus) {
    No_backup = 0,
    have_backup = 1
};

/**
 wallet model
 */
@class FMResultSet;
@interface WalletModel : NSObject

/*
 *表ID
 */
@property(nonatomic, strong) NSString *ID;
/*
 *钱包名称
 */
@property(nonatomic, strong) NSString  *wallet_nickName;
/*
 *钱包密码
 */
@property(nonatomic, strong) NSString  *wallet_pwd;
/*
 *钱包地址
 */
@property(nonatomic, strong) NSString  *wallet_address;
/*
 *keyStore
 */
@property(nonatomic, strong) NSString  *wallet_keyStore;
/*
 *助记词
 */
@property(nonatomic, strong) NSString  *wallet_mnemonicPhrase;
/*
 *私钥
 */
@property(nonatomic, strong) NSString  *wallet_privateKey;
/*
 *余额
 */
@property(nonatomic, strong) NSString  *wallet_balance;
/*
 *钱包类型
 */
@property(nonatomic, assign) WalletType wallet_type;
/*
 *交易状态
 */
@property(nonatomic, assign) WalletStatus wallet_status;

- (void)parseFromSet:(FMResultSet *)resultSet;

@end

NS_ASSUME_NONNULL_END
