# QTLogin iOS Client SDK-Checkout 使用文档

######update 2016-11-14
------

##1.如何集成

### 1.1 下载安装

* 使用CocoaPods集成

``` ruby
    pod 'QFLogin'
```

* 手动下载SDK集成

``` sh
    https://github.com/QTPay/QTPaySDK-iOS/archive/ui_checkout_all.zip
```
    必要依赖 Frameworks:
    * CFNetwork.framework
    * SystemConfiguration.framework
    * Security.framework

### 1.2 添加相关支付依赖库
导入支付宝和微信SDK（若工程集成过或使用CocoaPods集成则无需导入）

* __AlipaySDK:__
    * AlipaySDK.bundle
    * AlipaySDK.framework
    * libssl.a
    * libcrypto.a

* __WeChatSDK:__
    * libWeChatSDK.a

### 1.3 引入相关头文件

``` objc
#import <QTPaySDK.h>
#import <QTPayOrder.h>
```

## 2. 如何使用
支付过程参与对象：

* `Client`：集成方的终端（iOS/Android/Web）
* `Server`：集成方的后台
* `QTCloud`: 钱台支付服务方的云平台

### 2.1 支付流程

 1. 用户在登录`Client`后，`Client`请求`Server`获取`UserToken`（同时`Server`与`QTCloud`同步`UserToken`）
 2. `Client`初始化`QTPaySDK`相关参数

``` objc
    [QTPaySDK setQTPayWithAppID:@"123456"
              accessToken:self.userToken 
              appScheme:@"QTPaySDKDemo"
              callBack:^(NSDictionary *resultDic) {
              //处理回调返回结果
    }];
```

* 创建预订单（`Clinet`请求`Server`获取`OrderToken`）

``` objc
    // 生成订单对象 
    QTPayOrder *prePayOrder = [QTPayOrder new];
    prePayOrder.order_token = @"A764593SADD66523HSGA67575G";
    prePayOrder.out_sn     = @"JK2364563SA978638ADASD76523748";
    prePayOrder.pay_amt    = @"1000";
    prePayOrder.total_amt  = @"1000";
    prePayOrder.goods_info = @"包含基础护手,卸甲油胶,不含卸光疗延长甲.";
    prePayOrder.goods_name = @"武媚娘美甲基础套餐";
    prePayOrder.goods_num  = @"1";
    prePayOrder.mobile     = @"18888888888";
    prePayOrder.mchnt_name = @"武媚娘";
    prePayOrder.actionType = QTActionTypeGoods;
    prePayOrder.goods_memo = @"媚娘的店，有你好看，年终大促，买3赠1.";
```

* 获取用户账户信息（优惠券、余额、积分）

``` objc
    [[QTPaySDK defaultService] fetchUserDiscountInfoWithQueryType:(QTQueryDiscountType)type 								amount:(NSString *)amount
    							callBack:^(NSDictionary *resultDic) {
                // 处理回调返回的用户账户信息，用于展示和选择
    }];
```

* 发起支付

``` objc
    [[QTPaySDK defaultService] paymentRequestWithOrder:self.order 
                               callBack:^(QTRespCode respCode,
                                          QTPayType PayType,
                                          NSDictionary *resultDic) {
                // 处理回调返回的支付结果
    }];
```
* 账户余额充值

``` objc
    [[QTPaySDK defaultService] paymentRechargeRequestWithOrder:self.order 
                               callBack:^(QTRespCode respCode,
                                          QTPayType PayType,
                                          NSDictionary *resultDic) {
                // 处理回调返回的余额支付结果
    }];
```

### 2.2 查询

* 查询当前账户余额充值金额对应的优惠信息

``` objc
    [[QTPaySDK defaultService] fetchBalanceRechargeDiscountInfoWithAmount
                               callBack:^(NSDictionary *resultDic) {
              //处理回调返回的账户余额充值金额对应的优惠信息
    }];
```

* 查询账户余额充值金额规则

``` objc
    [[QTPaySDK defaultService] queryBalanceRechargeDiscountRuleCallBack:^(NSDictionary *resultDic) {
              //处理回调返回的账户余额充值金额规则
    }];
```

### 2.3 分享红包

* 根据订单号请求SDK取红包URL

``` objc
    [[QTPaySDK defaultService] fetchOrderShareURLCallBack:^(NSDictionary *resultDic) {       
                //处理回调返回的红包URL
    }];
```

### 3 使用钱台提供的收银台UI接口

* 发起支付

``` objc
    [[QTPaySDK defaultService] presentPaymentViewWithOrder:self.order 
                               callBack:^(QTRespCode respCode,
                                          QTPayType PayType,
                                          NSDictionary *resultDic) {
                // 处理回调返回的收银台支付结果
    }];
```

