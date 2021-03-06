# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codenjoy_connection/version'

Gem::Specification.new do |spec|
  spec.name          = 'codenjoy_connection'
  spec.version       = CodenjoyConnection::VERSION
  spec.authors       = ['anatoliliotych']
  spec.email         = ['anatoli.liotych@gmail.com']
  spec.summary       = %q{Gem handling ws connection and simple communication for numerous games in Codenjoy.}
  spec.homepage      = 'https://github.com/anatoliliotych/codenjoy_connection'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'eventmachine'
  spec.add_dependency 'faye-websocket'
  
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
