Pod::Spec.new do |s|
  s.name             = 'RCLiveModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of RCLiveModule.'
  s.homepage         = 'https://github.com/rccrx/RCLiveModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rccrx' => 'rccrx@qq.com' }
  s.source           = { :git => 'https://github.com/rccrx/RCLiveModule.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/Public/**/*.h'
  s.prefix_header_file = false
  
  # s.dependency 'AFNetworking', '~> 2.3'
end
