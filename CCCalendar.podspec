
Pod::Spec.new do |s|
  s.name             = 'CCCalendar'
  s.version          = '0.1.0'
s.summary          = 'CCCalendar is kind a BASIC TOOL of calculate Dates . '

  s.description      = <<-DESC
"CCCalendar is kind a BASIC TOOL of calculate Dates . No Examples ."
                       DESC

  s.homepage         = 'https://github.com/VArbiter/CCCalendar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'VArbiter' => 'elwinfrederick@163.com' }
  s.source           = { :git => 'https://github.com/VArbiter/CCCalendar.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CCCalendar/Classes/**/*'
end
