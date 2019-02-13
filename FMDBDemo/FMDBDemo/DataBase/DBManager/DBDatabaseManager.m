//
//  DBDatabaseManager.m
//  PSPTWallet
//
//  Created by YuboZhou on 2018/11/7.
//  Copyright © 2018 Passport. All rights reserved.
//

#import "DBDatabaseManager.h"

@implementation DBDatabaseManager

+ (instancetype)shareDBManager {
    
    static DBDatabaseManager *_shareDBManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _shareDBManager = [[self alloc]init];
    });
    
    return _shareDBManager;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.dbQueue = [[FMDatabaseQueue alloc]initWithPath:[self getDBPath]];
    }
    return self;
}

- (void)createDB {
    
    if (!self.baseDB) {
        
        self.baseDB = [FMDatabase databaseWithPath:[self getDBPath]];
        if (![self.baseDB open]) {
            [self openDB];
        }
    }
}

- (NSString *)getDBPath {
    
    return kDBPath;
}

- (BOOL)openDB {
    
    if (![self.baseDB open]) {
        return NO;
    }else{
        return YES;
    }
}

- (void)closeDB {
    
    if (self.baseDB) {
        [self.baseDB close];
    }
}

@end
