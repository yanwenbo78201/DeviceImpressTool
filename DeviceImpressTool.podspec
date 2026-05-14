#
# Be sure to run `pod lib lint DeviceImpressTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DeviceImpressTool'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DeviceImpressTool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yanwenbo78201/DeviceImpressTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanwenbo78201' => 'yanwenbo_78201@163.com' }
  s.source           = { :git => 'https://github.com/yanwenbo78201/DeviceImpressTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.requires_arc = true

  # 未写子路径时安装「System」及其依赖，行为与原先全量引入一致
  s.default_subspecs = 'System'

  # 生成 Clang 模块，Swift 可 import DeviceImpressTool
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'CLANG_ENABLE_MODULES' => 'YES'
  }

  s.subspec 'Broken' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/Broken/**/*.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/Broken/**/*.h'
    ss.frameworks = 'Foundation'
  end

  s.subspec 'Device' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/Device/**/*.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/Device/**/*.h'
    ss.frameworks = 'Foundation', 'UIKit', 'AppTrackingTransparency', 'AdSupport'
  end

  s.subspec 'Network' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/Network/**/*.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/Network/**/*.h'
    ss.frameworks = 'Foundation', 'CoreTelephony', 'SystemConfiguration'
  end

  s.subspec 'Storage' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/Storage/**/*.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/Storage/**/*.h'
    ss.frameworks = 'Foundation'
  end

  s.subspec 'Time' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/Time/**/*.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/Time/**/*.h'
    ss.frameworks = 'Foundation'
  end

  s.subspec 'Impress' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/Impress/**/*.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/Impress/**/*.h'
    ss.frameworks = 'Foundation', 'UIKit'
  end

  s.subspec 'System' do |ss|
    ss.source_files = 'DeviceImpressTool/Classes/SystemService.{h,m}'
    ss.public_header_files = 'DeviceImpressTool/Classes/SystemService.h'
    ss.dependency 'DeviceImpressTool/Broken'
    ss.dependency 'DeviceImpressTool/Device'
    ss.dependency 'DeviceImpressTool/Network'
    ss.dependency 'DeviceImpressTool/Storage'
    ss.dependency 'DeviceImpressTool/Time'
    ss.dependency 'DeviceImpressTool/Impress'
    ss.frameworks = 'Foundation'
  end
  
  # s.resource_bundles = {
  #   'DeviceImpressTool' => ['DeviceImpressTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
