//
//  Database.h
//  PSPTWallet
//
//  Created by YuboZhou on 2018/11/7.
//  Copyright © 2018 Passport. All rights reserved.
//

#ifndef Database_h
#define Database_h

#import "DBApi.h"
#import "DBDatabaseManager.h"
#import "WalletModel.h"

#define Wallet_TABLE  @"WalletTable"

#define DataBase [DBDatabaseManager shareDBManager]

#define DB_NAME @"PSPTWallet.sqlite"
#define kDBPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DB_NAME]

#endif /* Database_h */
