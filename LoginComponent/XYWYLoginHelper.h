
#import <Foundation/Foundation.h>
#import "OriginalLogin.h"


//typedef void(^successBlock)(HTTPModel *json);
typedef void(^failureBlock)(NSError *error);

@interface XYWYLoginHelper : NSObject

/**
 *  单例
 *
 *  @return 单例对象
 */
+ (XYWYLoginHelper *)shareInstance;

/**
 *  原生登陆方式, 用户名密码模式
 *
 *  @param userName 用户名
 *  @param psd      密码
 */
- (void)loginNative:(NSString *)userName
           password:(NSString *)psw;

/**
 *  原生登陆方式, 验证码模式
 *
 *  @param phoneNum  手机号
 *  @param verifCode 验证码
 */
- (void)loginNative:(NSString *)phoneNum
          verifCode:(NSString *)verifCode;

/**
 *  第三方登录方式
 *
 *  @param sourceType 第三方来源
 */
- (void)loginOtherPlatform:(LoginType)loginType;

/**
 *  退出登录
 */
- (void)logout;

/**
 *  修改密码，若修改成功，将同时修改本地存储的密码，否则根据失败原因进行相应的提示
 *
 *  @param originalPassword 原始密码
 *  @param newPassword      新密码
 *  @param reNewPassword    重复新密码
 *  @param successBlock     成功回调
 *  @param failureBlock     失败回调
 */
- (void)changePasswordWithOriginalPassword:(NSString *)originalPassword
                               newPassword:(NSString *)newPassword
                             reNewPassword:(NSString *)reNewPassword
                              successBlock:(successBlock)successBlock
                              failureBlock:(failureBlock)failureBlock;

/**
 *  根据验证码，进行手机号的绑定,若绑定成功，更新本地存储的用户信息，否则根据失败原因进行相应的提示
 *
 *  @param phoneNumber  手机号
 *  @param verifCode    验证码
 *  @param successBlock 成功回调
 *  @param failureBlock 失败回调
 */
- (void)bindingPhoneNumber:(NSString *)phoneNumber
                 verifCode:(int *)verifCode
              successBlock:(successBlock)successBlock
              failureBlock:(failureBlock)failureBlock;

/**
 *  修改绑定手机号，若修改成功，若修改成功，更新本地存储的用户信息，否则根据失败原因进行相应的提示
 *
 *  @param phoneNumber  手机号码
 *  @param verifCode    验证码
 *  @param successBlock 成功回调
 *  @param failureBlock 失败回调
 */
- (void)changeBindingPhoneNumber:(NSString *)phoneNumber
                       verifCode:(int *)verifCode
                    successBlock:(successBlock)successBlock
                    failureBlock:(failureBlock)failureBlock;;


/**
 *  获取验证码
 *
 *  @return 获取验证码是否成功
 */
- (void)getVerifCode;

@end
