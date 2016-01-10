# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'map/tube/version'

Gem::Specification.new do |spec|
  spec.name          = "map-tube"
  spec.version       = Map::Tube::VERSION
  spec.authors       = ["Radu-Bogdan Croitoru"]
  spec.email         = ["croitoruradubogdan@gmail.com"]

  spec.summary       = %q{Core library to process the map data}
  spec.description   = %q{The core module to process the map data. It provides the the interface to find the shortest route in terms of stoppage between two nodes.}
  spec.homepage      = "https://github.com/radubogdan/map-tube"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'nokogiri', '~> 1.6'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry', '~> 0.10.3'
end
