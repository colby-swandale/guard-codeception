# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/codeception/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-codeception'
  spec.version       = Guard::CodeceptionVersion::VERSION
  spec.authors       = ['Colby Swandale']
  spec.email         = ['colby@taplaboratories.com.au']
  spec.description   = %q{Guard gem for codeception}
  spec.summary       = %q{guard-codeception automatically runs codeception on file changes}
  spec.homepage      = 'https://github.com/colby-swandale/guard-codeception'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'guard', '~> 2.0'
 
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
