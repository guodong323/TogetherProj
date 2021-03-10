//
//  LoginView.m
//  教学课
//
//  Created by 阿栋 on 2021/3/10.
//

#import "LoginView.h"
#import <MBProgressHUD.h>
#import <Masonry/Masonry.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LoginView()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation LoginView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _dic = [NSMutableDictionary dictionary];
        _model = [[UserModel alloc] init];
        
        // 用户名Label
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = @"用户名:";
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_userNameLabel];
        
        // 密码Label
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.text = @"密码:";
        _passwordLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_passwordLabel];
        
        // 用户名输入Field
        _userNameField = [[UITextField alloc] init];
        _userNameField.placeholder = @"请输入用户名";
        _userNameField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_userNameField];
        
        // 密码输入Field
        _passwordField = [[UITextField alloc] init];
        _passwordField.placeholder = @"请输入密码";
        _passwordField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_passwordField];
        
        // 欧阳紫浩登陆按钮
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        _loginBtn.backgroundColor = [UIColor colorWithRed:72/255.0 green:65/255.0 blue:226/255.0 alpha:1];
        [_loginBtn setTintColor:[UIColor whiteColor]];
        [_loginBtn addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginBtn];
        
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(SCREEN_HEIGHT * 0.2069);
        make.left.mas_equalTo(self.mas_left).mas_offset(SCREEN_WIDTH * 0.072);
        make.width.mas_equalTo(SCREEN_WIDTH * 0.2);
        make.height.mas_equalTo(SCREEN_WIDTH * 0.04);
    }];
    
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameLabel.mas_bottom).mas_offset(SCREEN_HEIGHT * 0.082);
        make.left.width.height.mas_equalTo(_userNameLabel);
    }];
    
    [_userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(SCREEN_HEIGHT * 0.2451);
        make.left.mas_equalTo(self.mas_left).mas_offset(SCREEN_WIDTH * 0.08);
        make.width.mas_equalTo(SCREEN_WIDTH * 0.848);
        make.height.mas_equalTo(SCREEN_HEIGHT * 0.05);
    }];
    
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameField.mas_bottom).mas_offset(SCREEN_HEIGHT * 0.05);
        make.left.width.height.mas_equalTo(_userNameField);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passwordField.mas_bottom).mas_offset(SCREEN_HEIGHT * 0.2);
        make.left.mas_equalTo(self.mas_left).mas_offset(SCREEN_WIDTH * 0.128);
        make.height.mas_equalTo(SCREEN_WIDTH * 0.7467 * 52/280);
        make.width.mas_equalTo(SCREEN_WIDTH * 0.7467);
    }];
    _loginBtn.layer.cornerRadius = SCREEN_WIDTH * 0.7467 * 52/280 * 1/2;
}



#pragma mark 跳转到相应的界面
// 登陆
- (void) Login {
    _dic[@"userName"] = _userNameField.text;
    _dic[@"passWord"] = _passwordField.text;
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


- (NSString *)canLoginWithUserDic:(UserModel *)model {
    if ([model.userName isEqualToString:@"OYZH"] && [model.passWord isEqualToString:@"123456"]) {
        return @"欧阳紫浩";
    } else if ([model.userName isEqualToString:@"YCH"] && [model.passWord isEqualToString:@"654321"]) {
        return @"杨辰昊";
    }
    return @"";
}

- (void) hud:(MBProgressHUD *)hud setUpHud:(NSString *)remindLabel {
    hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = remindLabel;
    [hud hideAnimated:YES afterDelay:1.2];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
