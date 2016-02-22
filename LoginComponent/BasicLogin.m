//
//  BasicLogin.m
//  LoginModule
//
//  Created by weiyi on 16/2/18.
//  Copyright © 2016年 xywy. All rights reserved.
//

#import "BasicLogin.h"
#import "OriginalLogin.h"
@interface BasicLogin ()<LoginDelegate>

@end
@implementation BasicLogin
- (instancetype)initWithType:(LoginType)loginType{
    switch (loginType) {
        case LoginTypeOrigin: {
            self = [[OriginalLogin alloc] init];
        }
            break;
        case LoginTypeQQ: {
//            self = [[QQLogin alloc] init];
        }
            break;
        case LoginTypeWeibo: {
//            self = [[SinaLogin alloc] init];
        }
            break;
        case LoginTypeWeiXin: {
//            self = [[WeixinLogin alloc] init];
        }
            break;
        default:
            break;
    }
    return self;
}
@end
