//
//  LoginViewController.h
//  教学课
//
//  Created by 阿栋 on 2021/3/10.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

// 用户信息字典
@property (nonatomic, strong) NSMutableDictionary *dic;
// 用户登陆模型
@property (nonatomic, strong) UserModel *model;

- (NSString *)canLoginWithUserDic:(UserModel *)model;

@end

NS_ASSUME_NONNULL_END
