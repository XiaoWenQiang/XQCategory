

Pod::Spec.new do |s|

  s.name         = "XQCategory"
  s.version      = "1.0.0"
  s.summary      = "一个实用的iOS分类"
  s.description  = "一个实用的iOS分类，包含了日常开发过程中的常用的功能和扩展。"
                   
  s.homepage     = "https://www.jianshu.com/u/16227d25bcf4"
  s.license      = "MIT"


  s.author       = { "xiaoqiang" => "xiaowenqiang_1@126.com" }
  

  s.source       = { :git => "https://github.com/XiaoWenQiang/XQCategory", :tag => "1.0.0" }

  s.source_files  = "XQCategory/XQCategories/*.{h，m}" 
  s.requires_arc = true



end
