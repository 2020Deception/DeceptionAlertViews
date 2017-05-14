Pod::Spec.new do |s|
s.name             = 'DeceptionAlertViews'
s.version          = '0.7.0'
s.summary          = 'Used to return UIAlert(View|Controller) based on version of iOS. Now makes the latter simpler. Need legacy? Version <= 0.6.2 .'
s.homepage         = 'https://github.com/2020Deception/DeceptionAlertViews'
s.license          = 'MIT'
s.authors          = { 'Anonymous' => '2020deception@gmail.com' }
s.source           =  { :git => 'https://github.com/2020Deception/DeceptionAlertViews.git', :tag => s.version.to_s }
s.platform     = :ios, '9.0'
s.requires_arc = true
s.source_files = 'Pod/Classes/AlertView.{h,m}'
s.frameworks = 'UIKit'

end
