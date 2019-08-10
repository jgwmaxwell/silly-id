# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'silly-id/version'

Gem::Specification.new do |spec|
  spec.name          = 'silly-id'
  spec.version       = SillyId::VERSION
  spec.authors       = ['Glenn Jones']
  spec.email         = ['glenn@glennjon.es']
  spec.summary       = 'Locale-aware heroku-like random name generator, just a tad more silly'
  spec.description   = 'Generate memorable random names to use in your apps'\
                       ' or anywhere else.'
  spec.homepage      = 'https://github.com/glennpjones/silly-id'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'i18n'
end
