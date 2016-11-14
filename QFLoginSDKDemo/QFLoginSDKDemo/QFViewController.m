//
//  QFViewController.m
//  QFLogin
//
//  Created by gdy on 11/10/2016.
//  Copyright (c) 2016 gdy. All rights reserved.
//

#import "QFViewController.h"
#import <QFLoginSDK/QFLogin.h>


@interface QFViewController (){
    __weak IBOutlet UITextField *_usernameTF;
    __weak IBOutlet UITextField *_pwdTF;
}

@end

@implementation QFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)loginBtnClick:(id)sender {
    NSString* username = _usernameTF.text;
    NSString* pwd = _pwdTF.text;
    if (username.length > 0 && pwd.length > 0) {
        QFLogin* login = [QFLogin sharedInstance];
        [login setQFLoginSDKEnv:QFLoginSDKEnvProduction];
        [login loginWithInfo:@{@"username":username,@"password":pwd,@"expire_time":@"864000",@"udid":[[UIDevice currentDevice] identifierForVendor]} completeBlock:^(id task, NSDictionary *qfLoginResult, NSError *error) {
            if (error != nil) {
                NSLog(@"error:%@",error);
            }
            else{
                if ([qfLoginResult[@"respcd"] isEqualToString:@"0000"]) {
                    NSLog(@"userinfo:%@",qfLoginResult[@"data"]);
                }
                else{
                    NSLog(@"error:%@",qfLoginResult[@"resperr"]);
                }
            }
        }];
    }
    else{
        NSLog(@"用户名或密码不能为空");
    }
    
}

@end
