

#import "XYWYLoginHelper.h"
#import "SinaLogin.h"


@interface XYWYLoginHelper ()<LoginDelegate>

//@property (nonatomic, strong) SinaLogin *sinaLogin;

@end

@implementation XYWYLoginHelper

+ (XYWYLoginHelper *)shareInstance
{
    static XYWYLoginHelper *inst = nil;
    static dispatch_once_t p;
    
    dispatch_once(&p,^{
        inst = [[XYWYLoginHelper alloc] init];
    });
    
    return inst;
}

- (instancetype)init {
    if (self = [super init]) {
        
        
    }
    return self;
}

#pragma mark - LoginDelegate

/**
 *  登录失败
 *
 *  @param error 返回登录错误信息
 */
- (void)loginFailed:(NSError *)error {
    
}
/**
 *  放弃登录
 */
- (void)loginCanneled {
    
}
/**
 *  登陆成功后调用
 *
 *  @param userModel 登陆成功后返回的数据（包括token openid expirationDate）
 */
- (void)loginSuccessed:(UserModel *)userModel {
    
}

/**
 *  退出登陆成功后调用
 */
- (void)logout {
    
}

#pragma mark - private method

//- (XYWYUserInfo *)readUserInfoWithUserID:(NSString *)userID {
//    XYWYUserInfo *userInfo = [[XYWYUserInfo alloc] init];
//    
//    return userInfo;
//}

- (void)loginNative:(NSString *)userName password:(NSString *)psw {
    [[OriginalLogin new] loginNative:userName password:psw];
}

- (void)loginNative:(NSString *)phoneNum verifCode:(NSString *)verifCode {
#warning 验证码登录未实现
}

- (void)loginOtherPlatform:(LoginType)loginType {
    /*
     LoginTypeOrigin = 0, // 原生登陆
     LoginTypeQQ = 1,    // QQ三方登陆
     LoginTypeWeibo = 2, // Sina三方登陆
     LoginTypeWeiXin = 3 // WeiXin三方登陆
     */
    if (loginType) {
        switch (loginType) {
            case LoginTypeQQ:
                
                break;
            case LoginTypeWeibo:
                
                break;
            case LoginTypeWeiXin:
                
                break;
                
            default:
                break;
        }
    }
}
- (BOOL)clearUserDataWithUserID:(NSString *)userID {
    return YES;
}


@end
