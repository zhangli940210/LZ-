//
//  LZConnectTableViewController.m
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZConnectTableViewController.h"
#import "LZAddViewController.h"
#import "LZConnectItem.h"

@interface LZConnectTableViewController () <LZAddViewControllerDelegate>

/** 模型数据数组*/
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LZConnectTableViewController

#pragma mark - 懒加载数据
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 赋值
//    self.title = [NSString stringWithFormat:@"%@的通讯录", self.countName];
//    或者
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录", self.countName];
}

// 调整页面会调用该方法
// 找到目标控制器
// 给目标控制器添加成员属性
// 赋值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{   // 找到目标控制器
    LZAddViewController *add = segue.destinationViewController;
    // 设置代理
    add.delegate = self;
}

#pragma mark - LZAddViewControllerDelegate方法
- (void)addViewController:(LZAddViewController *)addViewController connetItem:(LZConnectItem *)connetItem
{
    // 用一个可变数组接收模型数据
    [self.dataArray addObject:connetItem];
    // 刷新
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
// 每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"data";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 获取模型数据
    LZConnectItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text= item.phone;
    return cell;
}

@end
