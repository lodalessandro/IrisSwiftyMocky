# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'SwiftyMockyLab' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SwiftyMockyTest
  pod "SwiftyMocky"

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
  end
end
