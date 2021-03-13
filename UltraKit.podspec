Pod::Spec.new do |spec|

  spec.name = "UltraKit"
  spec.version = "0.0.1"
  spec.summary = "Library for rapid prototyping of the UICollectionView layout."
  spec.homepage = "https://github.com/sergeyshalnov/UltraKit"

  spec.author = { "Sergey Shalnov" => "sergeyshalnov.dev@gmail.com" }
  spec.social_media_url = "https://www.instagram.com/yegrec"

  spec.platform = :ios, "13.0"
  spec.swift_version = "5.0"

  spec.framework = "UIKit"
  spec.source_files  = "UltraKit/**/*.{h,m,swift}"
  
  spec.source = { 
    :git => "https://github.com/sergeyshalnov/UltraKit.git", 
    :tag => "#{spec.version}"
  }

  spec.license = { 
    :type => "MIT",
    :file => "LICENSE"
  }

end
