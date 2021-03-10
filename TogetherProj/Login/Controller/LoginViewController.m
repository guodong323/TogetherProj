//
//  LoginViewController.m
//  教学课
//
//  Created by 阿栋 on 2021/3/10.
//

#import "LoginViewController.h"
#import "LoginView.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginView *loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:loginView];
    
    
}


@end
