Pod::Spec.new do |s|
  s.name             = 'RCCustomView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of RCCustomView.'
  s.homepage         = 'https://github.com/rccrx/RCCustomView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rccrx' => 'rccrx@qq.com' }
  s.source           = { :git => 'https://github.com/rccrx/RCCustomView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Classes/**/*'
  s.prefix_header_file = false
end
