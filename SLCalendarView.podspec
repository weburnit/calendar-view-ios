Pod::Spec.new do |s|
  s.name             = 'SLCalendarView'
  s.version          = '1.0.0-beta1'
  s.summary          = 'SLCalendarView Lib'

  s.description      = <<-DESC
Swift library for Calendar view
                       DESC

s.homepage           = 'http://btechso.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Phi Nguyen' => 'fsdn.ios.developer@gmail.com' }
  s.source           = { :git => 'https://github.com/weburnit/calendar-view-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'SLCalendarView/**/*.{swift}'
  s.resource_bundles = {
    'SLCalendarView' => ['SLCalendarView/**/*.{storyboard,xib,png}']
  }
  s.requires_arc = true
  s.dependency 'CVCalendar', '~> 1.4'
  s.dependency 'AlamofireImage', '~> 3.2'
end
