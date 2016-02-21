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
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
