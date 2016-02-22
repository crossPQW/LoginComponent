//
//  LoginDataManager.h
//  LoginModule
//
//  Created by 黄少华 on 16/2/17.
//  Copyright © 2016年 xywy. All rights reserved.
//  处理用户数据类,登录登出需要保存删除的操纵全在这里完成

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface LoginDataManager : NSObject


/**
 *  删除指定id数据
 */
+ (BOOL)clearDataWithUserid:(int)userid;

/**
 *  删除所有用户数据
 */
+ (BOOL)clearAllData;

/**
 *  读取用户
 */
- (UserModel *)readFromUserid:(int)userid;

/**
 *  写入
 */
- (BOOL)writeWithUser:(UserModel *)user;

/**
 *  获取所有的历史用户
 */
- (NSArray <UserModel *>*)getUserList;
@end
