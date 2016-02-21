//
//  LZAddViewController.m
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZAddViewController.h"
#import "LZConnectItem.h"

@interface LZAddViewController ()

/** 姓名*/
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
/** 电话*/
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
/** 添加*/
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation LZAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加监听事件
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)textChange
{
    // 判断，只有accountTextF和pwdTextF都有值，才能让登录按钮可以点击
    self.addBtn.enabled = self.nameTextF.text.length && self.phoneTextF.text.length;
}

/**
 *  添加
 */
- (IBAction)add {
    // 创建一个模型数据
    self.item = [LZConnectItem connectItemWithName:self.nameTextF.text phone:self.phoneTextF.text];
    // 判断
    if ([self.delegate respondsToSelector:@selector(addViewController:connetItem:)]) {
        // 调用
        [self.delegate addViewController:self connetItem:self.item];
        // 跳转页面
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 结束编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
