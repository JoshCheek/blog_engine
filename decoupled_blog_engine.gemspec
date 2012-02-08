# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "decoupled_blog_engine/version"

Gem::Specification.new do |s|
  s.name        = "decoupled_blog_engine"
  s.version     = BlogEngine::VERSION
  s.authors     = ["Josh Cheek"]
  s.email       = ["josh.cheek@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Proof of concept for a blog engine}
  s.description = %q{Proof of concept for a blog engine that doesn't depend on its delivery mechanism (e.g. Rails), this is a response to this gist https://gist.github.com/1763643}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", '~> 2.8.0'
  s.add_development_dependency "pry"
end
