lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'slideshowpro/version'

Gem::Specification.new do |s|
  s.name          = 'slideshowpro'
  s.version       =  Slideshowpro::VERSION
  s.author        = 'Steve Jabour'
  s.email         = ['steve@jabour.me', 'sjabour@summit.com']
  s.summary       = 'Slideshowpro Director API library in Ruby'
  s.description   = 'A library for interacting with the Slideshowpro Director API'
  s.license       = 'Summit Electric Supply'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_development_dependency 'rake', '~> 10.1.0'
  s.add_development_dependency 'rspec', '~> 2.14.1'

  s.add_runtime_dependency 'addressable', '~> 2.3.5'
  s.add_runtime_dependency 'rest-client', '~> 1.6.7'

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ['lib']
end
