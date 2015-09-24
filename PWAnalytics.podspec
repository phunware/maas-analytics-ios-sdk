Pod::Spec.new do |s|
  s.name         = "PWAnalytics"
  s.version      = "1.3.0"
  s.summary      = "The Phunware Analytics SDK for iOS"
  s.homepage     = "http://phunware.github.io/maas-analytics-ios-sdk/"
  s.author       = { 'Phunware, Inc.' => 'http://www.phunware.com' }
  s.social_media_url = 'https://twitter.com/Phunware'

  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/phunware/maas-analytics-ios-sdk.git", :tag => "v1.3.0" }
  s.license      = { :type => 'Copyright', :text => 'Copyright 2014 by Phunware Inc. All rights reserved.' }

  s.public_header_files = 'Framework/PWAnalytics.framework/Versions/A/Headers/*.h'
  s.ios.vendored_frameworks = 'Framework/PWAnalytics.framework'
  s.dependency 'PWCore'

  s.xcconfig      = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/PWAnalytics/**"'}
  s.ios.frameworks = 'Security', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony'
  s.requires_arc = true
end
