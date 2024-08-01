Pod::Spec.new do |s|
  s.name             = 'FSVideoKit'
  s.version          = '1.7.1'
  s.summary          = 'Fox Sports Video Kit'
  s.homepage         = 'http://foxsports.com.au'
  s.author           = { 'Rajesh Ramachandrakurup' => 'rajesh.ramachandrakurup@foxsports.com.au' }
  s.license          = { :type => 'Copyright', :text => 'Copyright 2022 Fox Sports' }
  s.source           = { :git => 'git@github.com:fsa-streamotion/streamotion-mobile-ios-videokit', :tag => "v#{s.version}" }

  s.source_files = 'Source/**/*.{h,swift,xcassets}'
  s.ios.vendored_frameworks = 'FSVideoKit.xcframework'

  s.platform                = :ios
  s.swift_version           = '5.0'
  s.ios.deployment_target   = '13.0'

  # external dependencies
  s.dependency 'Auth0', '1.39.1'
  s.dependency 'SimpleKeychain', '0.12.5'
  s.dependency 'YouboraAVPlayerAdapter', '6.6.6'
  s.dependency 'YouboraLib', '6.6.20'
  s.dependency 'JWTDecode', '2.6.3'
  s.dependency 'Alamofire', '5.8.1'
  s.dependency 'SnapKit', '~> 5.0'
  s.dependency 'NSObject+Rx', '~> 5.0'
  s.dependency 'RxCocoa', '~> 6.0'
  s.dependency 'RxSwift', '~> 6.0'
  s.dependency 'SDWebImage', '~> 5.0'

end
