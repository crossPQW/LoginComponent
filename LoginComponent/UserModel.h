//
//  LoginModel.h
//  LoginModule
//
//  Created by 黄少华 on 16/2/16.
//  Copyright © 2016年 xywy. All rights reserved.
//  用户


@interface UserModel : NSObject

//token
@property (nonatomic,copy) NSString *accessToken;
//过期时间
@property (nonatomic,strong) NSDate *expirationDate;
/**
 *  三方标示
 */
@property (nonatomic,copy) NSString *openid;
//头像
@property (nonatomic,copy) NSString *iconURL;
//昵称
@property (nonatomic,copy) NSString *nickName;
//用户名
@property (nonatomic,copy) NSString *userName;
//用户id
@property (nonatomic,assign) int usid;
//手机号
@property (nonatomic,strong) NSNumber *phoneNumber;
//密码的md5值
@property (nonatomic,copy) NSString *pwd_MD5;

- (NSMutableDictionary *)toDictionary;
- (instancetype)initWithJson:(NSDictionary *)json;

@end
