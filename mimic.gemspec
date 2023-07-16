# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-mimic'
  s.summary = "Copy a class's instance interface to an anonymous, new object that acts as a substitutable mimic for the class"
  s.version = '2.5.0.1'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/mimic'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

##
#  s.add_dependency 'evt-invocation'
  s.add_dependency 'evt-record_invocation'

  s.add_development_dependency 'test_bench'
end
