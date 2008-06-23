Gem::Specification.new do |s|
  s.name = 'merb_openid'
  s.version = '0.0.1'
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.summary = 'A Merb plugin for consuming OpenID'
  s.description = s.summary
  s.author = 'Dan Webb'
  s.email = 'dan@danwebb.net'
  s.add_dependency('merb', '>= 0.9.0')
  s.add_dependency('ruby-openid', '>= 2.0.3')
  s.require_path = 'lib'
  s.autorequire = s.name
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{lib,spec}/**/*")
end