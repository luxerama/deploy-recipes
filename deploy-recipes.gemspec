# -*- encoding: utf-8 -*-
require File.expand_path('../lib/deploy-recipes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vincent Siebert"]
  gem.email         = ["vincent@siebert.im"]
  gem.description   = %q{Collection of capistrano deploy recipes}
  gem.summary       = %q{Collection of capistrano deploy recipes used at the beans group}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "deploy-recipes"
  gem.require_paths = ["lib"]
  gem.version       = Deploy::Recipes::VERSION
  
  gem.add_dependency "capistrano", ">= 2.5.9"
end
