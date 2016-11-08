#
# Be sure to run `pod lib lint QuickRippleButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QuickRippleButton'
  s.version          = '0.0.1'
  s.summary          = 'Create Gmail style ripple button on iOS platform with one line of code or using interface builder.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This project aims to make it easy to create a ripple button on the iOS platform.The ripple-style animation is used in the latest Gmail app on Android. This project is inspired by this animation and want to create a custom class based on UIButton.
                       DESC

  s.homepage         = 'https://github.com/ansonyao/QuickRippleButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anson Yao' => 'yaoenxin@gmail.com' }
  s.source           = { :git => 'https://github.com/ansonyao/QuickRippleButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QuickRippleButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QuickRippleButton' => ['QuickRippleButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
