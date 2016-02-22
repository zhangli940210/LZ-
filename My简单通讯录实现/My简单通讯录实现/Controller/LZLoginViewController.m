//
//  LZLoginViewController.m
//  My简单通讯录实现
//
//  Created by apple on 16/2/21.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "LZConnectTableViewController.h"

#define kAccountText @"account"
#define kPwdText @"pwd"
#define kRemPwd @"remPwd"
#define kAutoLogin @"autoLogin"


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
    
    // 从偏好设置中获取数据
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *accout = [def objectForKey:kAccountText];
    NSString *pwd = [def objectForKey:kPwdText];
    BOOL remPwd = [def boolForKey:kRemPwd];
    BOOL autoLogin = [def boolForKey:kAutoLogin];
    // 设置开关按钮状态
    self.remPwdSwitch.on = remPwd;
    self.autoLoginSwitch.on = autoLogin;
    
    //如果保存密码
    if (self.remPwdSwitch.on) { // 如果记住密码按钮状态为on
        // 给账户文本框和密码文本框赋值
        self.accountTextF.text = accout;
        self.pwdTextF.text = pwd;
        if (self.autoLoginSwitch.on) { // 如果自动登录按钮状态为on
            // 调用该方法
            [self loginBtnClick];
        }
    }
    
    // 进来就判断一下，按钮是否可点击
    [self textChange];
    
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
- (IBAction)loginBtnClick
{
    //用户名与密码同时正确时跳转到下一个界面
//    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    // 显示登录转圈的页面
    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    if ([self.accountTextF.text isEqualToString:@"lz"] && [self.pwdTextF.text isEqualToString:@"123"]) {
        // 隐藏登录转圈的页面
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        // 跳转到第二个界面,该方法底层会调用一个方法prepareForSegue
        [self performSegueWithIdentifier:@"connect" sender:nil];
        
        // 保存到偏好设置
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:self.accountTextF.text forKey:kAccountText];
        [def setObject:self.pwdTextF.text forKey:kPwdText];
        [def setBool:self.remPwdSwitch.on forKey:kRemPwd];
        [def setBool:self.autoLoginSwitch.on forKey:kAutoLogin];
        
        // 立即写入
        [def synchronize]; // iOS9之后可以不写这句代码了
    }else {
        // 隐藏登录转圈的页面
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        // 提醒用户
        [MBProgressHUD showError:@"用户名与密码错误" toView:self.view];
    }
}

// 找到目标控制器
// 给目标控制器添加成员属性
// 赋值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender
{
//    NSLog(@"%@", segue.sourceViewController);
//    NSLog(@"%@", segue.destinationViewController);
    // 获得控制器
    LZConnectTableViewController *connect = segue.destinationViewController;
    connect.countName = self.accountTextF.text;
}

// 结束编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
@end
