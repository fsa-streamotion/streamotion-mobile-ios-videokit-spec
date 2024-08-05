Pod::Spec.new do |s|
  s.name             = 'FSVideoKit'
  s.version          = '1.7.2'
  s.summary          = 'Fox Sports Video Kit'
  s.homepage         = 'http://foxsports.com.au'
  s.author           = { 'Rajesh Ramachandrakurup' => 'rajesh.ramachandrakurup@foxsports.com.au' }
  s.license          = { :type => 'Copyright', :text => 'Copyright 2022 Fox Sports' }

  s.source           = { :http => 'https://github.com/fsa-streamotion/streamotion-mobile-ios-videokit-spec/raw/master/Archives/FSVideoKit-1.7.2.zip' }
  s.ios.vendored_frameworks = 'FSVideoKit.xcframework'

  s.platform                = :ios
  s.swift_version           = '5.0'
  s.ios.deployment_target   = '13.0'

  # external dependencies
  s.dependency 'Auth0', '2.7.1'
  s.dependency 'SimpleKeychain', '1.1.0'
  s.dependency 'YouboraAVPlayerAdapter', '~> 6.0'
  s.dependency 'YouboraLib', '~> 6.0'
  s.dependency 'JWTDecode', '3.1.0'
  s.dependency 'Alamofire', '5.9.1'
  s.dependency 'SnapKit', '~> 5.0'
  s.dependency 'NSObject+Rx', '~> 5.0'
  s.dependency 'RxCocoa', '~> 6.0'
  s.dependency 'RxSwift', '~> 6.0'
  s.dependency 'SDWebImage', '~> 5.0'

end
