//
//  ViewController.m
//  FDPlaceholderDemo
//
//  Created by 首牛科技 on 2018/12/19.
//  Copyright © 2018 ShouNew.com. All rights reserved.
//

#import "ViewController.h"
#import "FDViewSupport.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"FDPlaceholderDemo";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = @[].mutableCopy;
    [self __showError];
}
- (void)__showError{
    
    [self.view fd_showLoadingView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view fd_hideLoadingView];
        __weak typeof(self) weakSelf = self;
        [self.view fd_showErrorViewReloadAction:^{
            [weakSelf __configData];
        }];
    });
  
}
- (void)__configData{
    
    [self.view fd_showLoadingViewWithWords:@"数据请求中..." offsetY:-40];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view fd_hideLoadingView];
        if (!self.dataSource.count) {
            NSMutableAttributedString *emptyStr = [[NSMutableAttributedString alloc]initWithString:@"商品被\n抢光了"];
            [emptyStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(3, 4)];
            [self.view fd_showEmptyViewWithAttributedWords:emptyStr image:nil offsetY:-40];
        }
        [self.tableView reloadData];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.dataSource[indexPath.row] description];
    return cell;
}

@end
