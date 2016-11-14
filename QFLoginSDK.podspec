#
# Be sure to run `pod lib lint QFLoginSDK.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "QFLoginSDK"
  s.version          = "0.0.1"
  s.summary          = "A Login SDK of QFPay Inc. provide login service for QFPay merchant."
  s.description      = <<-DESC
                        A Login SDK of QFPay Inc. provide login service for QFPay merchant.
                       DESC
  s.homepage         = "https://github.com/guodongyangwen/QFLoginSDKDemo"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "gdy" => "guodongyang@qfpay.com" }
  s.source           = { :git => "https://github.com/guodongyangwen/QFLoginSDKDemo.git", :tag => '0.0.1' }
  # s.social_media_url = 'https://twitter.com/QTPaySDK'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.vendored_frameworks = "**/*.framework"
  s.preserve_paths = "**/*.framework"
  s.frameworks = 'UIKit'
  s.xcconfig  = { "OTHER_LDFLAGS" => "-lObjC",'LD_RUNPATH_SEARCH_PATHS' =>     '"$(SRCROOT)/**/*.framework"' }
  s.dependency 'AFNetworking', '~> 3.0'

end
