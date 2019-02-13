//
//  ViewController.m
//  FMDBDemo
//
//  Created by YuboZhou on 2018/12/11.
//  Copyright © 2018 YuboZhou. All rights reserved.
//

#import "ViewController.h"
#import "Database.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 增
    WalletModel *model = [[WalletModel alloc] init];
    model.wallet_nickName = @"测试钱包";
    model.wallet_address = @"0x123456789";
    BOOL add = [DBApi walletAddRecord:model];
    
    // 查
    NSArray *results = [DBApi walletSelectAllLocalWallet];
    NSLog(@"%@",results);
    
    // 改
    NSString *sql = [NSString stringWithFormat:@"UPDATE %@  SET wallet_balance = '%@' WHERE wallet_address = '%@'", Wallet_TABLE, @"100", @"0x123456789"];
    BOOL update = [DBApi walletExecuteUpdate:sql];
    
    // 删
    BOOL delete = [DBApi walletDeleteRecord:@"0x123456789"];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
