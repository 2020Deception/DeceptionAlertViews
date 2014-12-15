Pod::Spec.new do |s|
  s.name             = "DeceptionAlertViews"
  s.version          = "0.1.0"
  s.summary          = "gives an appropriate UIAlertView or UIAlertController depending on what version iOS is being used"
  s.homepage         = "https://github.com/2020Deception/DeceptionAlertViews"
  s.license          = 'MIT'
  s.author           = { "Anonymous" => "2020deception@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/DeceptionAlertViews.git", :tag => s.version.to_s }
  s.platform     = :ios, '4.3'
  s.requires_arc = true
  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'DeceptionAlertViews' => ['Pod/Assets/*.png']
  }
  s.frameworks = 'UIKit'
end
