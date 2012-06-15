# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version', __FILE__)

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
  gem.add_dependency "pivotal-tracker", ">= 0.5.4"
  gem.add_dependency "grit", ">= 2.5.0"
  gem.add_dependency "tinder", ">= 1.8.0"
  gem.add_dependency "aws-sdk", ">= 1.5.3"
end
