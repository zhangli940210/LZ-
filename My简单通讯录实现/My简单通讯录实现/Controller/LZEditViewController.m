//
//  LZEditViewController.m
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZEditViewController.h"
#import "LZConnectItem.h"

@interface LZEditViewController ()
/** 编辑按钮*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;
/** 姓名*/
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
/** 电话*/
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
/** 保存按钮*/
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation LZEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextF.text = self.connectItem.name;
    self.phoneTextF.text = self.connectItem.phone;
}

/**
 *  编辑
 */
- (IBAction)edit:(id)sender {
    // 判断
    if ([self.editBtn.title isEqualToString:@"编辑"]) {
        // 设置保存按钮显示
        self.saveBtn.hidden = NO;
        // 设置姓名文本框可以点击
        self.nameTextF.enabled = YES;
        // 设置电话文本框可以点击
        self.phoneTextF.enabled = YES;
        // 电话文本框成为第一响应者
        [self.phoneTextF becomeFirstResponder];
        // 设置按钮文字
        self.editBtn.title = @"取消";
    } else { // 取消
        // 设置保存按钮隐藏
        self.saveBtn.hidden = YES;
        // 设置姓名文本不可以点击
        self.nameTextF.enabled = NO;
        // 设置电话文本框不可以点击
        self.phoneTextF.enabled = NO;
        // 退出编辑界面
        [self.view endEditing:YES];
        // 设置按钮文字
        self.editBtn.title = @"编辑";
        
        // 还原数据
        self.nameTextF.text = self.connectItem.name;
        self.phoneTextF.text = self.connectItem.phone;
    }
}

/**
 *  保存
 */
- (IBAction)save {
    // 修改数据
    self.connectItem.name = self.nameTextF.text;
    self.connectItem.phone = self.phoneTextF.text;
    //通知联系人控制器.刷新列表.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload" object:nil];
    // 跳转页面
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)setContactItem:(LZConnectItem *)connectItem {
//    _connectItem = connectItem;
//
//    self.nameTextF.text = self.connectItem.name;
//    self.phoneTextF.text = self.connectItem.phone;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
