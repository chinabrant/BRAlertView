
Pod::Spec.new do |s|
  s.name             = 'BRAlertView'
  s.version          = '0.1.0'
  s.summary          = 'A high customize text AlertView for iOS.'

  s.description      = <<-DESC
                        可高度定制的 alert view, 目前只支持显示string和attributedString
                       DESC

  s.homepage         = 'https://github.com/chinabrant/BRAlertView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'brant' => 'sjwu1234@gmail.com' }
  s.source           = { :git => 'https://github.com/chinabrant/BRAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'BRAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BRAlertView' => ['BRAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
