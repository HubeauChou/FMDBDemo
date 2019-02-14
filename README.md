# FMDBDemo
FMDB的简单集成封装示例，可以进行多表管理。

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
