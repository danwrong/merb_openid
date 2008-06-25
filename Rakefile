require 'rubygems'
require 'rake/gempackagetask'
require 'rake/contrib/rubyforgepublisher'

spec = eval(File.read(File.join(File.dirname(__FILE__), 'merb_openid.gemspec')))

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{spec.name}-#{spec.version} --no-update-sources}
end

task :verify_user do
  raise "RUBYFORGE_USER environment variable not set!" unless ENV['RUBYFORGE_USER']
end

desc "Publish gem+tgz+zip on RubyForge. You must make sure lib/version.rb is aligned with the CHANGELOG file"
task :publish_packages => [:verify_user, :package] do
  package_name = [spec.name, spec.version].join '-'
  
  release_files = FileList[
    "pkg/#{package_name}.gem"
  ]
  unless spec.version =~ /RC[0-9]$/
    require 'meta_project'
    require 'rake/contrib/xforge'

    Rake::XForge::Release.new(MetaProject::Project::XForge::RubyForge.new('merbopenid')) do |xf|
      # Never hardcode user name and password in the Rakefile!
      xf.user_name = ENV['RUBYFORGE_USER']
      xf.files = release_files.to_a
      xf.release_name = "Merb OpenID #{spec.version}"
      xf.release_notes = ''
      xf.release_changes = ''
    end
  else
    puts "SINCE THIS IS A PRERELEASE, FILES ARE UPLOADED WITH SSH, NOT TO THE RUBYFORGE FILE SECTION"
    puts "YOU MUST TYPE THE PASSWORD #{release_files.length} TIMES..."

    host = "merbopenid-website@rubyforge.org"
    remote_dir = "/var/www/gforge-projects/merbopenid"

    publisher = Rake::SshFilePublisher.new(
      host,
      remote_dir,
      File.dirname(__FILE__),
      *release_files
    )
    publisher.upload

    puts "UPLOADED THE FOLLOWING FILES:"
    release_files.each do |file|
      name = file.match(/pkg\/(.*)/)[1]
      puts "* http://merbopenid.rubyforge.org/#{name}"
    end

    puts "They are not linked to anywhere, so don't forget to tell people!"
  end
end


namespace :jruby do

  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{#{SUDO} jruby -S gem install pkg/#{spec.name}-#{Merb::VERSION}.gem --no-rdoc --no-ri}
  end
  
end