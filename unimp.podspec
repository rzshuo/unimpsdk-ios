#
#  Be sure to run `pod spec lint unimp.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "unimp"
  s.version      = "3.99"
  s.summary      = "UniMPSDK"
  s.homepage     = "https://gitcode.net/dcloud/unimpsdk-ios"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "wangzhitong" => "wangzhitong@dcloud.io" }
  s.source       = { :git => "https://gitcode.net/dcloud/unimpsdk-ios.git", :tag => "#{s.version}"}
  s.default_subspec = 'Core'
  s.platform     = :ios, '11.0'

  ### 基础库(必选)

  s.subspec 'Core' do |ss|
    ss.public_header_files = 'UniMPSDK/Core/Headers/**/*.{h,swift}'
    ss.source_files = 'UniMPSDK/Core/Headers/**/*.{h,swift}'
    ss.frameworks = 'UIKit', 'CoreText','JavaScriptCore','WebKit','CoreTelephony','MediaPlayer','QuartzCore','CFNetwork',
    'Foundation','CoreFoundation','CoreGraphics','QuickLook'
    ss.vendored_libraries = 'UniMPSDK/Core/Libs/*.{a}'
    ss.vendored_frameworks = 'UniMPSDK/Core/Libs/*.{framework}'
    ss.resources = 'UniMPSDK/Core/Resources/*'
    ss.libraries = 'c++','iconv'
  end

  ### 子模块

  s.subspec 'Accelerometer' do |ss|
    ss.frameworks = 'Accelerate'
    ss.vendored_libraries = 'UniMPSDK/Accelerometer/Libs/*.{a}'
  end

  s.subspec 'Audio' do |ss|
    ss.frameworks = 'AVFoundation'
    ss.vendored_libraries = 'UniMPSDK/Audio/Libs/*.{a}'
    ss.vendored_frameworks = 'UniMPSDK/Audio/Libs/*.{framework}'  
  end

  s.subspec 'Camera&Gallery' do |ss|
    ss.public_header_files = 'UniMPSDK/Camera&Gallery/Headers/**/*.{h,swift}'
    ss.source_files = 'UniMPSDK/Camera&Gallery/Headers/**/*.{h,swift}'
    ss.resources = 'UniMPSDK/Camera&Gallery/Resources/*'
    ss.frameworks = 'AssetsLibrary','Photos','CoreMedia','MetalKit','GLKit'
    ss.vendored_libraries = 'UniMPSDK/Camera&Gallery/Libs/*.{a}'
  end

  s.subspec 'Contacts' do |ss|
    ss.frameworks = 'AddressBookUI','AddressBook','AVFoundation','CoreVideo','CoreMedia'
    ss.vendored_libraries = 'UniMPSDK/Contacts/Libs/*.{a}'
  end

  s.subspec 'File' do |ss|
    ss.vendored_libraries = 'UniMPSDK/File/Libs/*.{a}'
  end

  s.subspec 'NativeJS' do |ss|
    ss.vendored_libraries = 'UniMPSDK/NativeJS/Libs/*.{a}'
  end

  s.subspec 'Message' do |ss|
    ss.frameworks = 'MessageUI'
    ss.vendored_libraries = 'UniMPSDK/Message/Libs/*.{a}'
  end

  s.subspec 'Orientation' do |ss|
    ss.frameworks = 'CoreLocation'
    ss.vendored_libraries = 'UniMPSDK/Orientation/Libs/*.{a}'
  end

  s.subspec 'Proximity' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Proximity/Libs/*.{a}'
  end

  s.subspec 'XMLHttpRequest' do |ss|
    ss.vendored_libraries = 'UniMPSDK/XMLHttpRequest/Libs/*.{a}'
  end

  s.subspec 'Zip' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Zip/Libs/*.{a}'
  end

  s.subspec 'Fingerprint' do |ss|
    ss.frameworks = 'LocalAuthentication'
    ss.vendored_libraries = 'UniMPSDK/Fingerprint/Libs/*.{a}'
  end

  s.subspec 'FaceId' do |ss|
    ss.frameworks = 'LocalAuthentication'
    ss.vendored_libraries = 'UniMPSDK/Fingerprint/Libs/*.{a}'
  end

  s.subspec 'Sqlite' do |ss|
    ss.libraries = 'sqlite3.0'
    ss.vendored_libraries = 'UniMPSDK/Sqlite/Libs/*.{a}'
  end

  s.subspec 'IBeacon' do |ss|
    ss.frameworks = 'CoreBluetooth','CoreLocation'
    ss.vendored_libraries = 'UniMPSDK/IBeacon/Libs/*.{a}'
  end

  s.subspec 'BlueTooth' do |ss|
    ss.frameworks = 'CoreBluetooth'
    ss.vendored_libraries = 'UniMPSDK/BlueTooth/Libs/*.{a}'
  end

  s.subspec 'LivePusher' do |ss|
    ss.frameworks = 'AVFoundation','QuartzCore',
    'OpenGLES','AudioToolbox','VideoToolbox',
    'Accelerate','CoreMedia','CoreTelephony',
    'SystemConfiguration','CoreMotion'
    ss.vendored_libraries = 'UniMPSDK/LivePusher/Libs/*.{a}'
    ss.vendored_frameworks = 'UniMPSDK/LivePusher/Libs/*.{framework}'
  end

  s.subspec 'Barcode' do |ss|
    ss.public_header_files = 'UniMPSDK/Barcode/Headers/**/*{.h,.swift}'
    ss.source_files = 'UniMPSDK/Barcode/Headers/**/*.{h,swift}'
    ss.frameworks = 'AVFoundation','ImageIO','CoreVideo','CoreMedia'
    ss.vendored_libraries = 'UniMPSDK/Barcode/Libs/*.{a}'
    ss.libraries = 'iconv.2'
  end

  s.subspec 'Video' do |ss|
    ss.public_header_files = 'UniMPSDK/Video/Headers/**/*{.h,.swift}'
    ss.source_files = 'UniMPSDK/Video/Headers/**/*.{h,swift}'
    ss.frameworks = 'AudioToolbox','AVFoundation',
    'CoreGraphics','CoreMedia','VideoToolbox',
    'VideoToolbox','MediaPlayer','MobileCoreServices',
    'OpenGLES','QuartzCore','UIKit'
    ss.resources = 'UniMPSDK/Video/Resources/*'
    ss.vendored_libraries = 'UniMPSDK/Video/Libs/*.{a}'
    ss.vendored_frameworks = 'UniMPSDK/Video/Libs/*.{framework}'
    ss.libraries = 'c++','z','bz2'
    ss.dependency  'unimp/Masonry'
  end

  s.subspec 'Geolocation' do |ss|
    ss.frameworks = 'CoreLocation'
    ss.vendored_libraries = 'UniMPSDK/Geolocation/Libs/*.{a}'
  end

  s.subspec 'Geolocation-Baidu' do |ss|
    ss.frameworks = 'SystemConfiguration','Security'
    ss.vendored_libraries = 'UniMPSDK/Geolocation/Baidu/Libs/*.{a}'
    ss.libraries = 'c++','sqlite3.0' 
    ss.dependency 'unimp/Geolocation'
    ss.dependency 'BMKLocationKit', '2.0.9'
    ss.dependency 'unimp/BaiduMapCommon'
  end

  s.subspec 'Geolocation-Gaode' do |ss|
    ss.frameworks = 'ExternalAccessory','GLKit','security','CoreTelephony','SystemConfiguration'
    ss.vendored_libraries = 'UniMPSDK/Geolocation/Gaode/Libs/*.{a}'
    ss.libraries = 'c++','z'
    ss.dependency 'AMapLocation','2.10.0'
    ss.dependency 'AMapSearch', '9.7.0'
    ss.dependency 'unimp/Geolocation'
  end

  s.subspec 'Map' do |ss|
    ss.frameworks = 'MapKit','CoreLocation','GLKit'
    ss.vendored_libraries = 'UniMPSDK/Map/Libs/*.{a}'
  end

  s.subspec 'Map-Baidu' do |ss|
    ss.frameworks = 'QuartzCore','CoreGraphics','CoreTelephony',
    'SystemConfiguration','Security','OpenGLES'
    ss.vendored_libraries = 'UniMPSDK/Map/Baidu/Libs/*.{a}'
    ss.libraries = 'c++','sqlite3.0'
    ss.dependency 'BaiduMapKit', '6.6.0'
    ss.dependency 'unimp/BaiduMapCommon'
    ss.dependency 'unimp/Map'
  end

  s.subspec 'Map-Gaode' do |ss|
    ss.resources = 'UniMPSDK/Map/Gaode/Resources/*'
    ss.vendored_libraries = 'UniMPSDK/Map/Gaode/Libs/*.{a}'
    ss.libraries = 'c++'
    ss.dependency  'AMap3DMap','9.7.0'
    ss.dependency 'unimp/Masonry'
    ss.dependency 'unimp/Map'
  end

  s.subspec 'Speech' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Speech/Libs/*.{a}'
  end

  s.subspec 'Speech-Baidu' do |ss|
    ss.resources = 'UniMPSDK/Speech/Baidu/Resources/*'
    ss.frameworks = 'AudioToolbox','AVFoundation','CFNetwork',
    'CoreLocation','CoreTelephony','SystemConfiguration','GLKit'
    ss.vendored_libraries = 'UniMPSDK/Speech/Baidu/Libs/*.{a}'
    ss.dependency 'unimp/Speech'
    ss.libraries = 'c++','z','sqlite3.0'
  end

  s.subspec 'Payment' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Payment/Libs/*.{a}'
  end

  s.subspec 'Payment-IAP' do |ss|
    ss.frameworks = 'StoreKit'
    ss.vendored_libraries = 'UniMPSDK/Payment/IAP/Libs/*.{a}'
    ss.dependency 'unimp/Payment'
  end

  s.subspec 'Payment-AliPay' do |ss|
    ss.frameworks = 'CFNetwork','SystemConfiguration','CoreMotion','Security'
    ss.vendored_libraries = 'UniMPSDK/Payment/AliPay/Libs/*.{a}'
    ss.libraries = 'c++'
    ss.dependency 'AlipaySDK-iOS','15.8.16'
    ss.dependency 'unimp/Payment'
  end

  s.subspec 'Payment-Wechat' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Payment/Wechat/Libs/*.{a}'
    ss.libraries = 'z','sqlite3.0'
    ss.dependency 'WechatOpenSDK-XCFramework','2.0.2'
    ss.dependency 'unimp/Payment'
  end

  s.subspec 'Payment-Paypal' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Payment/Paypal/Libs/*.{a}'
    # ss.dependency 'PayPalCheckout','1.2.0'
    ss.dependency 'unimp/Payment'
  end

  s.subspec 'Payment-Stripe' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Payment/Stripe/Libs/*.{a}'
    # ss.dependency 'Stripe','23.18.2'
    ss.dependency 'unimp/Payment'
  end

  s.subspec 'Share' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Share/Libs/*.{a}'
  end

  s.subspec 'Share-Sina' do |ss|
    ss.frameworks = 'ImageIO'
    ss.vendored_libraries = 'UniMPSDK/Share/Libs/*.{a}'
    ss.libraries = 'sqlite3.0'
    ss.dependency 'Weibo_SDK', '3.3.5'
    ss.dependency 'unimp/Share'
  end

  s.subspec 'Share-QQ' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Share/QQ/Libs/*.{a}'
    ss.dependency 'unimp/QQ'
    ss.dependency 'unimp/Share'
  end

  s.subspec 'Share-Wechat' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Share/Wechat/Libs/*.{a}'
    ss.dependency 'WechatOpenSDK-XCFramework','2.0.2'
    ss.dependency 'unimp/Share'
  end

  s.subspec 'Share-Wechat-Nopay' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Share/Wechat/Libs/*.{a}'
    ss.dependency 'unimp/Wechat-Nopay'
    ss.dependency 'unimp/Share'
  end

  s.subspec 'Oauth' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Oauth/Libs/*.{a}'
  end

  s.subspec 'Oauth-Sina' do |ss|
    ss.frameworks = 'ImageIO'
    ss.vendored_libraries = 'UniMPSDK/Oauth/Sina/Libs/*.{a}'
    ss.libraries = 'sqlite3.0'
    ss.dependency 'Weibo_SDK', '3.3.5'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Oauth-QQ' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Oauth/QQ/Libs/*.{a}'
    ss.dependency 'unimp/QQ'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Oauth-Wechat' do |ss|
    ss.frameworks = 'CoreTelephony','SystemConfiguration'
    ss.vendored_libraries = 'UniMPSDK/Oauth/Wechat/Libs/*.{a}'
    ss.dependency 'WechatOpenSDK-XCFramework','2.0.2'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Oauth-Wechat-Nopay' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Oauth/Wechat/Libs/*.{a}'
    ss.dependency 'unimp/Wechat-Nopay'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Oauth-Apple' do |ss|
    ss.frameworks = 'AuthenticationServices'
    ss.vendored_libraries = 'UniMPSDK/Oauth/Apple/Libs/*.{a}'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Oauth-Google' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Oauth/Google/Libs/*.{a}'
    ss.dependency 'GoogleSignIn','7.0.0'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Oauth-Facebook' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Oauth/Facebook/Libs/*.{a}'
    # ss.dependency 'FBSDKLoginKit','16.2.1'
    ss.dependency 'unimp/Oauth'
  end

  s.subspec 'Statistic' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Statistic/Libs/*.{a}'
  end

  s.subspec 'Statistic-Umeng' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Statistic/Umeng/Libs/*.{a}'
    ss.dependency  'UMCommon','7.4.2'
    ss.dependency  'UMAPM','1.8.4'
    ss.dependency 'unimp/Statistic'
  end

  s.subspec 'Log' do |ss|
    ss.vendored_libraries = 'UniMPSDK/Log/Libs/*.{a}'
  end

  s.subspec 'Masonry' do |ss|
    ss.public_header_files = 'UniMPSDK/Masonry/Headers/**/*{.h,.swift}'
    ss.source_files = 'UniMPSDK/Masonry/Headers/**/*.{h,swift}'
    ss.vendored_frameworks = 'UniMPSDK/Masonry/Libs/*.{framework}'
  end

  s.subspec 'BaiduMapCommon' do |ss|
    ss.vendored_libraries = 'UniMPSDK/BaiduMapCommon/Libs/*.{a}'
  end

  s.subspec 'Wechat-Nopay' do |ss|
    ss.public_header_files = 'UniMPSDK/Wechat-Nopay/Headers/**/*{.h,.swift}'
    ss.source_files = 'UniMPSDK/Wechat-Nopay/Headers/**/*.{h,swift}'
    ss.vendored_libraries = 'UniMPSDK/Wechat-Nopay/Libs/*.{a}'
  end

  s.subspec 'QQ' do |ss|
    ss.vendored_frameworks = 'UniMPSDK/QQ/Libs/*.{framework}'
  end
  


end
