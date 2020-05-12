#
# Be sure to run `pod lib lint JKBeeHivewMJRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JKBeeHivewMJRefresh'
  s.version          = '0.1.0'
  s.summary          = '刷新组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
基于MJRefresh和BeeHive的刷新组件
                       DESC

  s.homepage         = 'https://github.com/aasdsjk/JKBeeHivewMJRefresh'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aasdsjk' => '1289647068@qq.com' }
  s.source           = { :git => 'https://github.com/aasdsjk/JKBeeHivewMJRefresh.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JKBeeHivewMJRefresh/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JKBeeHivewMJRefresh' => ['JKBeeHivewMJRefresh/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.subspec 'Framework' do |cs|
    cs.dependency 'MJRefresh' , '~>3.0'
    cs.dependency 'BeeHive' , '~>1.6'
  end
end
