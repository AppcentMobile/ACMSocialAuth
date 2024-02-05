Pod::Spec.new do |spec|
    spec.name         = "ACMSocialAuth"
    spec.version      = "1.0.0"
    spec.summary      = "ACMSocialAuth iOS Library"
    spec.description  = <<-DESC
      ACMSocialAuth is a social authentication library that help developers to make social auth easily.
    DESC

    spec.homepage     = "https://github.com/AppcentMobile/ACMSocialAuth"  
    spec.license      = { :type => "Apache License, Version 2.0", :file => "LICENCE" }  
    spec.author       = "burak"
    spec.platform     = :ios
    spec.ios.deployment_target  = '13.0'
    spec.swift_version = '5.0'  
    spec.source       = { :git => "https://github.com/AppcentMobile/ACMSocialAuth.git", :tag => "#{spec.version}" }
    spec.source_files  = "Sources/**/*.{h,m,swift}"
    spec.dependency 'FBSDKCoreKit', '16.3.1'
    spec.dependency 'FBSDKLoginKit', '16.3.1'
    spec.dependency 'GoogleSignIn', '7.0.0'
  end
