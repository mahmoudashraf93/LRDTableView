
Pod::Spec.new do |s|
  s.name             = 'LRDTableView'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight custom tableView to handle easily empty tableViews'
 
  s.description      = <<-DESC
A lightweight custom tableView to handle easily empty tableViews by showing a label & image and button
                       DESC
 
  s.homepage         = 'https://github.com/mahmoudashraf93/LRDTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mahmoud Ashraf' => 'mahmoud28@gmail.com' }
  s.source           = { :git => 'https://github.com/mahmoudashraf93/LRDTableView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'LRDTableViewExample/LRDTableView.swift'
 
end