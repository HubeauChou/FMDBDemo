//
//  DBDatabaseManager.h
//  PSPTWallet
//
//  Created by YuboZhou on 2018/11/7.
//  Copyright © 2018 Passport. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "Database.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBDatabaseManager : NSObject

@property(nonatomic, strong) FMDatabase *baseDB;
@property(nonatomic, strong) FMDatabaseQueue *dbQueue;

+ (instancetype)shareDBManager;

- (void)createDB;

- (NSString *)getDBPath;

- (BOOL)openDB;

- (void)closeDB;

@end

NS_ASSUME_NONNULL_END
