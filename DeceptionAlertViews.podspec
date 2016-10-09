Pod::Spec.new do |s|
s.name             = 'DeceptionAlertViews'
s.version          = '0.6.2'
s.summary          = 'This class gives an appropriate UIAlertView or UIAlertController depending on what version iOS is being used.'
s.homepage         = 'https://github.com/2020Deception/DeceptionAlertViews'
s.license          = 'MIT'
s.authors          = { 'Anonymous' => '2020deception@gmail.com' }
s.source           =  { :git => 'https://github.com/2020Deception/DeceptionAlertViews.git', :tag => '0.6.2' }
s.platform     = :ios, '4.3'
s.requires_arc = true
s.source_files = 'Pod/Classes/AlertView.{h,m}'
s.frameworks = 'UIKit'

end
