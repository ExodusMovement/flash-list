require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
new_arch_enabled = ENV['RCT_NEW_ARCH_ENABLED']

Pod::Spec.new do |s|
  s.name             = 'RNFlashList'
  s.version          = package['version']
  s.summary          = package['description']
  s.homepage         = package['homepage']
  s.license          = package['license']
  s.author           = package['author']
  s.platforms        = { :ios => '11.0', :tvos => '12.0' }
  s.source           = { git: 'https://github.com/ExodusMovement/flash-list.git', branch: "exodus-1.7.1" }
  s.source_files     = 'ios/Sources/**/*'
  s.requires_arc     = true
  s.swift_version    = '5.0'

  if new_arch_enabled
    s.pod_target_xcconfig = {
      'OTHER_SWIFT_FLAGS' => '-D RCT_NEW_ARCH_ENABLED',
    }
  end

  # install_modules_dependencies is available since RN 0.71
  if respond_to?(:install_modules_dependencies, true)
    install_modules_dependencies(s)
  else
    s.dependency "React-Core"
  end

  # Tests spec
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'ios/Tests/**/*'
    test_spec.framework = 'XCTest'
  end
end
