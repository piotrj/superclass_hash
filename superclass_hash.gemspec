# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "superclass_hash/version"

Gem::Specification.new do |s|
  s.name        = "superclass_hash"
  s.version     = SuperclassHash::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr Jakubowski"]
  s.email       = ["piotrj@gmail.com"]
  s.homepage    = "https://github.com/piotrj/superclass_hash"
  s.summary     = %q{Hash useful for class keys}
  s.description = %q{Hash that would return values that has been assigned to keys that are superclasses of asked key}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", ">= 2.6.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
end
