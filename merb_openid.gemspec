--- !ruby/object:Gem::Specification 
name: merb_openid
version: !ruby/object:Gem::Version 
  version: 0.0.1
platform: ruby
authors: 
- Dan Webb
autorequire: merb_openid
bindir: bin
cert_chain: []

date: 2008-06-23 00:00:00 +01:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: merb
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 0.9.0
    version: 
- !ruby/object:Gem::Dependency 
  name: ruby-openid
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 2.0.3
    version: 
description: Merb plugin for OpenID authentication
email: dan@danwebb.net
executables: []

extensions: []

extra_rdoc_files: 
- README
- LICENSE
files: 
- LICENSE
- README
- Rakefile
- lib/merb_openid
- lib/merb_openid/controller_extensions.rb
- lib/merb_openid.rb
- spec/merb_openid_spec.rb
- spec/spec_helper.rb
has_rdoc: true
homepage: http://merb-plugins.rubyforge.org/merb_openid/
post_install_message: 
rdoc_options: []

require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: 
rubygems_version: 1.2.0
signing_key: 
specification_version: 2
summary: Merb plugin for OpenID authentication
test_files: []


