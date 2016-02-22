//
//  BasicLogin.h
//  LoginModule
//
//  Created by weiyi on 16/2/18.
//  Copyright © 2016年 xywy. All rights reserved.
//  SinaLogin与originalLogin的父类

#import <Foundation/Foundation.h>
@class UserModel;
@protocol LoginDelegate <NSObject>

@optional
/**
 *  登录失败
 *
 *  @param error 返回登录错误信息
 */
- (void)loginFailed:(NSError *)error;
/**
 *  放弃登录
 */
- (void)loginCanneled;
/**
 *  登陆成功后调用
 *
 *  @param userModel 登陆成功后返回的数据（包括token openid expirationDate）
 */
- (void)loginSuccessed:(UserModel *)userModel;

/**
 *  退出登陆成功后调用
 */
- (void)logout;

@end

typedef enum {
    LoginTypeOrigin = 0, // 原生登陆
    LoginTypeQQ = 1,    // QQ三方登陆
    LoginTypeWeibo = 2, // Sina三方登陆
    LoginTypeWeiXin = 3 // WeiXin三方登陆
} LoginType;

@interface BasicLogin : NSObject

@property (nonatomic, weak) id<LoginDelegate>delegate;

- (instancetype)initWithType:(LoginType)loginType;

/**
 *  根据userModel注册原生账号
 *
 *  @param userModel 三方数据（token、openid、expirationDate）
 */
- (void)accountWithUserModel:(UserModel *)userModel;
@end
