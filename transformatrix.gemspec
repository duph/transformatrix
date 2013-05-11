# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transformatrix/version'

Gem::Specification.new do |gem|
  gem.name          = "transformatrix"
  gem.version       = Transformatrix::VERSION
  gem.authors       = ["Fredrik Persen Fostvedt"]
  gem.email         = ["fpfostvedt@gmail.com"]
  gem.description   = "Transformation matrices"
  gem.summary       = "The gem generates transformation matrices"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
