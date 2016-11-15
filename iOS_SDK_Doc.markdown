# QFLogin iOS Client SDK-Checkout 使用文档

######update 2016-11-14
------

##1.如何集成

* 使用CocoaPods集成

``` ruby
    pod 'QFLoginSDK'
```

* 手动下载SDK集成

``` sh
    https://github.com/QTPay/QTPaySDK-iOS/archive/ui_checkout_all.zip
```

## 2. 如何使用

* 导入头文件

```
   #import <QFLoginSDK/QFLogin.h>
```


* 添加代码

```

QFLogin* login = [QFLogin sharedInstance];

[login setQFLoginSDKEnv:QFLoginSDKEnvProduction];

NSDictionary* dicInfo =@{
                            @"username":@"13141152232",
                            @"password":@"111111",
                            @"expire_time":@"864000",
                            @"udid":@"ADFDEFAFEAFAEGAAWGA"
                        };

[login loginWithInfo:dicInfo completeBlock:^(id task, NSDictionary *qfLoginResult, NSError *error) {
    if (error != nil) {
        NSLog(@"error:%@",error);
    }
    else{
        if ([qfLoginResult[@"respcd"] isEqualToString:@"0000"]) {    
            NSLog(@"resp:%@",qfLoginResult);    
        }    
        else{    
              NSLog(@"error:%@",qfLoginResult[@"resperr"]);
            }
        }
    }];
```

