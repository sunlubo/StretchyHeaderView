#
#  Be sure to run `pod spec lint StretchyHeaderView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "StretchyHeaderView"
  s.version      = "1.0.0"
  s.summary      = "A generic stretchy header for UIScrollView, and allows you to change navigation bar's appearance dynamically."
  s.homepage     = "https://github.com/sunlubo/StretchyHeaderView"
  s.license      = { :type => "MIT", :file => "License" }
  s.author       = { "sunlubo" => "sunlubo.sun@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/sunlubo/StretchyHeaderView.git", :tag => s.version }
  s.source_files  = "StretchyHeaderView/Classes/*.swift"
end
