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

@end

@implementation LZAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    }
    // 调整到
    
}

// 结束编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
