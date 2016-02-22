//
//  LoginModel.m
//  LoginModule
//
//  Created by 黄少华 on 16/2/16.
//  Copyright © 2016年 xywy. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithJson:(NSDictionary *)json
{
    if (self = [super init]) {
        //配置
    }
    return self;
}

- (NSMutableDictionary *)toDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    if (self.accessToken) {
        dict[@"accessToken"] = self.accessToken;
    }
    if (self.expirationDate) {
        dict[@"expirationDate"] = self.expirationDate;
    }
    if (self.iconURL) {
        dict[@"iconURL"] = self.iconURL;
    }
    if (self.nickName) {
        dict[@"nickName"] = self.nickName;
    }
    if (self.userName) {
        dict[@"userName"] = self.userName;
    }
    if (self.usid) {
        dict[@"usid"] = [NSString stringWithFormat:@"%d",self.usid];
    }
    if (self.phoneNumber) {
        dict[@"phoneNumber"] = self.phoneNumber;
    }
    if (self.pwd_MD5) {
        dict[@"password"] = self.pwd_MD5;
    }
    
    return dict;
}

@end
