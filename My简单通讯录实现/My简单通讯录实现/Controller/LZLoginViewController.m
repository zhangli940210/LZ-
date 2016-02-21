//
//  LZLoginViewController.m
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZLoginViewController.h"
#import "MBProgressHUD+XMG.h"

@interface LZLoginViewController ()
/** 账户*/
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
/** 密码*/
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
/** 记住密码*/
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
/** 自动登录*/
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
/** 登录按钮*/
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加监听事件
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)textChange
{
    // 判断，只有accountTextF和pwdTextF都有值，才能让登录按钮可以点击
    self.loginBtn.enabled = self.accountTextF.text.length && self.pwdTextF.text.length;
}

/**
 *  记住密码
 */
- (IBAction)remPwd {
    // 记住密码没有选择，那么自动登录按钮也没有选择
    if (self.remPwdSwitch.isOn == NO) {
//        self.autoLoginSwitch.isOn = NO; 该方法报错
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

/**
 *  自动登录
 */
- (IBAction)autoLogin {
    // 自动登录按钮选择了，那么记住密码也选择
    if (self.autoLoginSwitch.isOn == YES) {
        [self.remPwdSwitch setOn:YES animated:YES];
    }
}

/**
 *  登录
 */
- (IBAction)loginBtnClick {
    //用户名与密码同时正确时跳转到下一个界面
//    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    // 显示登录转圈的页面
    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    if ([self.accountTextF.text isEqualToString:@"lz"] && [self.pwdTextF.text isEqualToString:@"123"]) {
        // 隐藏登录转圈的页面
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        // 跳转到第二个界面
        [self performSegueWithIdentifier:@"connect" sender:nil];
    }else {
        // 隐藏登录转圈的页面
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        // 提醒用户
        [MBProgressHUD showError:@"用户名与密码错误" toView:self.view];
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
