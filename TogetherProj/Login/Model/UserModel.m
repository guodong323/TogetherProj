//
//  UserModel.m
//  TogetherProj
//
//  Created by 阿栋 on 2021/3/10.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        self.userName = dic[@"userName"];
        self.passWord = dic[@"passWord"];
    }
    return self;
}


+ (instancetype)modelWithDic:(NSDictionary *)dic {
    return [[UserModel alloc] initWithDic:dic];
}

@end
