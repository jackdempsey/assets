require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "assets"
    gem.summary = %Q{small layer that sits on top of paperclip and provides some conveniences}
    gem.description = %Q{Assets is a simple gem that provides an ActiveRecord model that handles attachments via paperclip, 
                        and provides additional helpful and often common functionality}
    gem.email = "jack.dempsey@gmail.com"
    gem.homepage = "http://github.com/jackdempsey/assets"
    gem.authors = ["Jack Dempsey"]
    gem.add_dependency "paperclip", "~> 2.3.3"
    gem.add_dependency "activerecord", "~> 3.0.0"
    gem.add_development_dependency "rspec", "~> 2.0.0.beta.22"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "assets #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
