//
//  LoginView.h
//  教学课
//
//  Created by 阿栋 on 2021/3/10.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LoginViewDelegate <NSObject>

- (void)Login;

@end


@interface LoginView : UIView

// 用户名
@property (nonatomic, strong) UILabel *userNameLabel;
// 密码
@property (nonatomic, strong) UILabel *passwordLabel;
// 用户名输入框
@property (nonatomic, strong) UITextField *userNameField;
// 密码输入框
@property (nonatomic, strong) UITextField *passwordField;
// 登陆按钮
@property (nonatomic, strong) UIButton *loginBtn;
// 登陆界面代理
@property (nonatomic, weak) id<LoginViewDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
