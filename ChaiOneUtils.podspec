Pod::Spec.new do |s|
  s.name     = 'ChaiOneUtils'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Low level Objective-C utilities'
  s.homepage = 'http://github.com/chaione/ChaiOneUtils'
  s.author   = { 'Ben Scheirman' => 'ben@scheirman.com' }

  s.source   = { :git => 'http://github.com/chaione/ChaiOneUtils.git' }
  s.source_files = "**/*.{h,m}"
  s.requires_arc = false
end
