//
//  UserModel.h
//  TogetherProj
//
//  Created by 阿栋 on 2021/3/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

// 用户名
@property (nonatomic, strong) NSString *userName;
// 密码
@property (nonatomic, strong) NSString *passWord;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)modelWithDic:(NSDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
