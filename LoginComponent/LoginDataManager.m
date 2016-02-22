//
//  LoginDataManager.m
//  LoginModule
//
//  Created by 黄少华 on 16/2/17.
//  Copyright © 2016年 xywy. All rights reserved.
//

#import "LoginDataManager.h"

@interface LoginDataManager()

/**
 *  登陆过的所有用户
 */
@property (nonatomic, strong) NSMutableArray *users;

@end
@implementation LoginDataManager

+ (BOOL)clearDataWithUserid:(int)userid
{
    BOOL clearFlag = [self removeFile:userid];
    return clearFlag;
}

+ (BOOL)clearAllData
{
    BOOL clearFlag = [self clearAllData];
    return clearFlag;
}

- (UserModel *)readFromUserid:(int)userid
{
    NSDictionary* userDictionary = [self loadDictionaryFromFile:userid];
    
    if (userDictionary) {
        return [[UserModel alloc] initWithJson:userDictionary];
        
    }else{
        return nil;
    }
}

- (BOOL)writeWithUser:(UserModel *)user
{
    //保存到用户列表
    if (![self.users containsObject:user]) {
        [self.users addObject:user];
    }
    
    //存入doucument
    NSDictionary *dict = [user toDictionary];
    BOOL writeFlag;
    if (dict) {
       writeFlag = [self saveDictionary:dict toFile:user.usid];
    }
    return writeFlag;
}

- (NSArray<UserModel *> *)getUserList
{
    return self.users ? self.users : nil;
}

#pragma mark - 数据读写操作
+ (BOOL)removeAllFile
{
    NSString *path = [NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()];
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (BOOL)removeFile:(int)userid{
    if (!userid) return NO;
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()];
    NSString *fn = [NSString stringWithFormat:@"%@/%d",path,userid];
    BOOL result = [[NSFileManager defaultManager] removeItemAtPath:fn error:nil];
    return result;
}

- (NSDictionary*)loadDictionaryFromFile:(int)userid{
    if (!userid) return nil;
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()];
    NSString *fn = [NSString stringWithFormat:@"%@/%d",path,userid];
    
    return [[NSDictionary alloc] initWithContentsOfFile:fn];
}

- (BOOL)saveDictionary:(NSDictionary *)dictionary toFile:(int)userid
{
    if (!userid || dictionary == nil) return NO;
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()];
    NSString *fn = [NSString stringWithFormat:@"%@/%d",path,userid];
    BOOL result = [dictionary writeToFile:fn atomically:YES];
    return result;
}


- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}
@end
