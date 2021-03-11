//
//  LoginViewController.m
//  教学课
//
//  Created by 阿栋 on 2021/3/10.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import <MBProgressHUD.h>
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LoginViewController () <LoginViewDelegate>

@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _loginView.delegate = self;
    _dic = [NSMutableDictionary dictionary];
    _model = [[UserModel alloc] init];
    [self.view addSubview:_loginView];
    
    
}

#pragma mark 登陆页面的代理方法
- (void)Login {
    _dic[@"userName"] = _loginView.userNameField.text;
    _dic[@"passWord"] = _loginView.passwordField.text;
    _model = [UserModel modelWithDic:_dic];
    NSLog(@"%@ ==== %@",_model.userName,_model.passWord);
    if ([[self canLoginWithUserDic:_model] isEqualToString:@"欧阳紫浩"]) {
        //跳转
        NSLog(@"登陆成功");
    }else if ([[self canLoginWithUserDic:_model] isEqualToString:@"杨辰昊"]){
        // 跳转
        NSLog(@"登陆成功");
    }else {
        [self hud:_hud setUpHud:@"账号密码错误"];
    }
}

// 判断账号密码的方法
- (NSString *)canLoginWithUserDic:(UserModel *)model {
    if ([model.userName isEqualToString:@"OYZH"] && [model.passWord isEqualToString:@"123456"]) {
        return @"欧阳紫浩";
    } else if ([model.userName isEqualToString:@"YCH"] && [model.passWord isEqualToString:@"654321"]) {
        return @"杨辰昊";
    }
    return @"";
}

// 提示
- (void) hud:(MBProgressHUD *)hud setUpHud:(NSString *)remindLabel {
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = remindLabel;
    [hud hideAnimated:YES afterDelay:1.2];
}


@end
