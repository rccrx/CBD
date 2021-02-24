Pod::Spec.new do |s|
  s.name             = 'RCAudioEngine'
  s.version          = '0.0.1'
  s.summary          = 'A short description of RCAudioEngine.'
  s.homepage         = 'https://github.com/rccrx/RCAudioEngine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rccrx' => 'rccrx@qq.com' }
  s.source           = { :git => 'https://github.com/rccrx/RCAudioEngine.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/Public/**/*.h'
  s.resource_bundles = {
    'RCAudioEngine' => ['Assets/**/*']
  }
  s.prefix_header_file = false
end
