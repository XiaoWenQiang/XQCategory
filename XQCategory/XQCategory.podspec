

Pod::Spec.new do |s|

  s.name         = "XQCategory"
  s.version      = "0.0.1"
  s.summary      = "一个实用的iOS分类"
  s.description  = "一个实用的iOS分类，包含了日常开发过程中的常用的功能和扩展。"
                   
  s.homepage     = "https://github.com/XiaoWenQiang/XQCategory"
  s.license      = "MIT"


  s.author             = { "xiaoqiang" => "xiaowenqiang_1@126.com" }
  

  s.source       = { :git => "https://github.com/XiaoWenQiang/XQCategory", :tag => "0.0.1" }


  s.source_files  = "XQCategory/XQCategory/XQCategories/**/*.{h,m}" #需要托管的源代码路径
  s.requires_arc = true



end
