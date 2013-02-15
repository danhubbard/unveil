# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unveil/version'

Gem::Specification.new do |gem|
  gem.name          = "unveil"
  gem.version       = Unveil::VERSION
  gem.authors       = ["Joe James"]
  gem.email         = ["joe@the-undefined.com"]
  gem.description   = %q{A rack based web framework, an excercise to understand rails by building my own from scratch}
  gem.summary       = %q{A rack based framework}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rack'
end
