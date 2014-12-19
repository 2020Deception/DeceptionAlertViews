Pod::Spec.new do |s|
s.name             = 'DeceptionAlertViews'
s.version          = '0.1.2'
s.summary          = 'gives an appropriate UIAlertView or UIAlertController depending on what version iOS is being used'
s.homepage         = 'https://github.com/2020Deception/DeceptionAlertViews'
s.license          = 'MIT'
s.authors          = { 'Anonymous' => '2020deception@gmail.com' }
s.source           =  { :git => 'https://github.com/2020Deception/DeceptionAlertViews.git', :tag => 'v0.1.2' }
s.platform     = :ios, '4.3'
s.requires_arc = true
s.source_files = 'AlertView.{h,m}'
s.frameworks = 'UIKit'

end