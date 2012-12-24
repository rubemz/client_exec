# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "client_exec/support/version"

Gem::Specification.new do |s|
  s.name        = "client_exec"
  s.version     = ClientExec::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Mazzi"]
  s.email       = ["jmazzi@site5.com"]
  s.homepage    = ""
  s.summary     = %q{A Ruby library for working with the Client Exec API}
  s.description = %q{A Ruby library for working with the Client Exec API}

  s.rubyforge_project = "client_exec"

  s.add_runtime_dependency 'faraday', '~> 0.8.4'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  s.add_runtime_dependency 'json', '~> 1.7.5'

  s.add_development_dependency 'rspec', '~> 2.12.0'
  s.add_development_dependency 'awesome_print', '~> 1.1.0'
  s.add_development_dependency 'rake', '~> 10.0.3'
  s.add_development_dependency 'fakeweb', '~> 1.3'
  s.add_development_dependency 'activesupport', "~> 3.2.9"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_paths = ["lib"]
end
