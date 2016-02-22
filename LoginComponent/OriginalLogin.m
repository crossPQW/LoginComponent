//
//  OriginalLoginModule.m
//  LoginModule
//
//  Created by 黄少华 on 16/2/16.
//  Copyright © 2016年 xywy. All rights reserved.
//

#import "OriginalLogin.h"
#import "HTTPLoginApi.h"
#import "AuthMacro.h"
#import "LoginDataManager.h"
@implementation OriginalLogin


- (void)logoutWithUserID:(int)userid
{
    [LoginDataManager clearDataWithUserid:userid];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(logout)]) {
        [self.delegate logout];
    }
}

- (void)loginNative:(NSString *)userName password:(NSString *)pwd
{
#warning TODO 需要将paramsDict换为真实的参数,同时需要将HTTPModel转换为UserModel
    NSDictionary *paramsDict;
    [HTTPLoginApi loginInfo:paramsDict success:^(HTTPModel *json) {
        
        UserModel *usermodel = (UserModel *)json;
        [self handleLoginSuccessWithResponse:usermodel];
    } FailureBlock:^(NSError *error) {
        [self handleLoginFail];
    }];
}

- (void)loginNative:(NSString *)phoneNum verifCode:(NSString *)verifCode
{
#warning TODO 需要将paramsDict换为真实的参数,同时需要将HTTPModel转换为UserModel
    NSDictionary *paramsDict;
    [HTTPLoginApi loginInfo:paramsDict success:^(HTTPModel *json) {
        
        UserModel *usermodel = (UserModel *)json;
        [self handleLoginSuccessWithResponse:usermodel];
        
    } FailureBlock:^(NSError *error) {
        [self handleLoginFail];
    }];

}

- (void)handleLoginSuccessWithResponse:(UserModel *)user
{
    //把登陆结果传递给tool
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginSuccessed)]) {
        [self.delegate loginSuccessed:nil];
    }
    
    //用户信息写入document
    [[[LoginDataManager alloc] init] writeWithUser:user];
}

- (void)handleLoginFail
{
    //把登陆结果传递给tool
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginFailed)]) {
        [self.delegate loginFailed:nil];
    }
    
    [SVProgressHUD showErrorWithStatus:@"登陆失败"];
}

@end
