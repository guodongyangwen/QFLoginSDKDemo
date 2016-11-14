#
# Be sure to run `pod lib lint QTPaySDK.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "QTPaySDK"
  s.version          = "0.0.8"
  s.summary          = "A Pay SDK of QFPay Inc. Include WeChat Pay, AliPay etc."
  s.description      = <<-DESC
                        In 钱方商户APP, third-part server can provide service for QFPay's merchant conveniently.'
                       DESC
  s.homepage         = "https://github.com/bjxiaowanzi/QTPaySDK-iOS"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Zhou Cheng" => "zhoucheng@qfpay.com" }
  s.source           = { :git => "git@git.qfpay.net:ZhouCheng/QTPaySDK-iOS-ZC.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/QTPaySDK'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.resource_bundles = {
    'QTPaySDKResource' => ['Pod/Assets/*.*']
  }

  s.public_header_files = 'Pod/Classes/Header/*.h'
  s.frameworks = 'UIKit', 'CoreTelephony'
  s.libraries = 'z', 'c++', 'sqlite3'
  s.dependency 'AFNetworking', '~> 3.0.0'
  s.dependency 'MBProgressHUD', '0.9'
  s.dependency 'WebViewJavascriptBridge', '~> 5.0'

end
