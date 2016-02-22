//
//  OriginalLoginModule.h
//  LoginModule
//
//  Created by 黄少华 on 16/2/16.
//  Copyright © 2016年 xywy. All rights reserved.
//  原生登录类

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "BasicLogin.h"
@interface OriginalLogin : BasicLogin

/**
 *  退出登录
 */
- (void)logoutWithUserID:(int)userid;


/**
 *  用户名密码登陆
 *
 *  @param userName 用户名
 *  @param psd      密码
 */
- (void)loginNative:(NSString *)userName
           password:(NSString *)pwd;

/**
 *  手机验证码登陆
 *
 *  @param phoneNum  手机号
 *  @param verifCode 验证码
 */
- (void)loginNative:(NSString *)phoneNum
          verifCode:(NSString *)verifCode;
@end
