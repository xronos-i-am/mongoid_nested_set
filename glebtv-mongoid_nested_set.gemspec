# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid_nested_set/version"

Gem::Specification.new do |s|
  s.name        = "glebtv-mongoid_nested_set"
  s.version     = MongoidNestedSet::VERSION
  s.authors     = ["GlebTV", "Brandon Turner"]
  s.email       = ["bt@brandonturner.net"]
  s.homepage    = "http://github.com/glebtv/mongoid_nested_set"
  s.summary     = %q{Nested set based tree implementation for Mongoid}
  s.description = %q{Fully featured tree implementation for Mongoid using the nested set model}
  s.licenses    = ["MIT"]

  s.rubyforge_project = "mongoid_nested_set"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'mongoid', [">= 5.0.0.beta", "< 6.0"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'
  s.add_development_dependency 'mongoid-rspec', '2.3.0.beta'

  s.add_development_dependency 'rspec-expectations', "~> 3.3"
end

