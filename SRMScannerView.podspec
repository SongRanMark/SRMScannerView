Pod::Spec.new do |s|
  s.name             = 'SRMScannerView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SRMScannerView.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/githubsr/SRMScannerView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'githubsr' => 'marksong@augmentum.com.cn' }
  s.source           = { :git => 'https://github.com/githubsr/SRMScannerView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'SRMScannerView/Classes/**/*'
  # s.resource_bundles = {
  #   'SRMScannerView' => ['SRMScannerView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SRMCategory'
end
