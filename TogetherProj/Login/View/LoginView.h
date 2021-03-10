//
//  LoginView.h
//  教学课
//
//  Created by 阿栋 on 2021/3/10.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN


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
// 用户信息字典
@property (nonatomic, strong) NSMutableDictionary *dic;
// 用户登陆模型
@property (nonatomic, strong) UserModel *model;

 
- (NSString *)canLoginWithUserDic:(UserModel *)model;

@end

NS_ASSUME_NONNULL_END
