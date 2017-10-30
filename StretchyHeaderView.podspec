Pod::Spec.new do |s|
  s.name         = "StretchyHeaderView"
  s.version      = "3.0.0"
  s.summary      = "A generic stretchy header for UIScrollView, and allows you to change navigation bar's appearance dynamically."
  s.homepage     = "https://github.com/sunlubo/StretchyHeaderView"
  s.license      = { :type => "MIT", :file => "License" }
  s.author       = { "sunlubo" => "sunlubo.sun@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/sunlubo/StretchyHeaderView.git", :tag => s.version }
  s.source_files  = "StretchyHeaderView/Classes/*.swift"
end
