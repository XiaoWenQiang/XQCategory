#
#  Be sure to run `pod spec lint XQCategory.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name     = "XQCategory"
s.version  = "1.0.0"
s.license  = "MIT"
s.summary  = "一个实用的iOS分类"
s.homepage = "https://github.com/XiaoWenQiang"
s.author   = { "xiaoqiang" => "xiaowenqiang_1@126.com" }
s.social_media_url = "http://weibo.com/xzjxylophone"
s.source       = { :git => "https://github.com/XiaoWenQiang/XQCategory", :tag => "1.0.0" }
s.description = %{
一个实用的iOS分类，包含了日常开发过程中的常用的功能和扩展。
}
s.source_files = "XQCategory","XQCategory/**/*.{h,m}"
s.frameworks = 'Foundation', 'UIKit'
s.requires_arc = true
s.platform = :ios, '8.0'
end
