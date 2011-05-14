# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "issues/version"

Gem::Specification.new do |s|
  s.name        = "issues"
  s.version     = Issues::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Albert"]
  s.email       = ["davidbalbert@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A command line interface to GitHub Issues with offline support}
  s.description = %q{A command line interface to GitHub Issues with offline support}

  s.rubyforge_project = "issues"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
