//
//  QFLogin.h
//  Pods
//
//  Created by gdy on 2016/11/10.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, QFLoginSDKEnv) {
    QFLoginSDKEnvDebug              = 0, // **** 线下环境
    QFLoginSDKEnvQA                 = 1, // **** QA 环境
    QFLoginSDKEnvSandBox            = 2, // **** 线上测试环境
    QFLoginSDKEnvProduction         = 3, // **** 正式环境
};

typedef void(^QFLoginResult)(id task,NSDictionary* qfLoginResult,NSError* error);

@interface QFLogin : NSObject

+ (id)sharedInstance;

- (void)setQFLoginSDKEnv:(QFLoginSDKEnv)env;

- (void)loginWithInfo:(NSDictionary*)dicLoginInfo completeBlock:(QFLoginResult)completeBlock;

@end
