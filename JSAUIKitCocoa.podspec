
Pod::Spec.new do |s|

  s.name         = "JSAUIKitCocoa"
  s.version      = "0.1.1"
  s.summary      = "Use Cocoa UIKit with JSAppSugar and JSA4Cocoa."
  s.description  = "JSAUIKitCocoa is a MVC framework for building iOS Apps using JavaScript and Objective-C."
  s.homepage     = "https://github.com/JSAppSugar/JSAUIKitCocoa"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Neal"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/JSAppSugar/JSAUIKitCocoa.git", :tag => "#{s.version}" }
  s.source_files  = "JSAUIKitCocoa/**/*.{h,m}"
  s.public_header_files = "JSAUIKitCocoa/*.h"
  s.resources = "Assets/jsa"
  s.framework  = "UIKit"
  s.requires_arc = true
  s.dependency "JSA4Cocoa", "~> 1.0"
  s.dependency "MyLayout", "~> 1.6"

end
