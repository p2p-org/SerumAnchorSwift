Pod::Spec.new do |s|
  s.name             = 'SerumAnchorSwift'
  s.version          = '0.1.0'
  s.summary          = 'An implementation of Serum Anchor written in pure Swift.'

  s.description      = <<-DESC
  SerumAnchorSwift is an implementation of Serum Anchor, which is a framework for Solana's Sealevel runtime.
                       DESC

  s.homepage         = 'https://github.com/p2p-org/SerumAnchorSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chung Tran' => 'bigearsenal@gmail.com' }
  s.source           = { :git => 'https://github.com/p2p-org/SerumAnchorSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.swift_versions = '5.0'

  s.source_files = 'SerumAnchorSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SerumAnchorSwift' => ['SerumAnchorSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'BufferLayoutSwift', '~> 0.4.1'
end
