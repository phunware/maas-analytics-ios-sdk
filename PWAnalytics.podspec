Pod::Spec.new do |s|
  s.name         = "PWAnalytics"
  s.version      = "1.3.1"
  s.summary      = "The Phunware Analytics SDK for iOS"
  s.homepage     = "http://phunware.github.io/maas-analytics-ios-sdk/"
  s.author       = { 'Phunware, Inc.' => 'http://www.phunware.com' }
  s.social_media_url = 'https://twitter.com/Phunware'
  s.requires_arc = true
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/phunware/maas-analytics-ios-sdk.git", :tag => "v1.3.1" }
  s.license      = { :type => 'Copyright', :text => 'Copyright 2014 by Phunware Inc. All rights reserved.' }

  s.dependency 'PWCore'
  s.ios.frameworks = 'Security', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony'
  
  s.ios.vendored_frameworks = 'Framework/PWAnalytics.framework'
  
end
