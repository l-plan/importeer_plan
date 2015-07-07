# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'importeer_plan/version'

Gem::Specification.new do |spec|
  spec.name          = "importeer_plan"
  spec.version       = ImporteerPlan::VERSION
  spec.authors       = ["rolf"]
  spec.email         = ["rolf@l-plan.nl"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{only purpose is provide some reusable defaults for importing and handling (.xls-)files }
  spec.description   = %q{only purpose is provide some reusable defaults for importing and handling (.xls-)files }
  spec.homepage      = "http://www.l-plan.nl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "spreadsheet"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", ">= 4.0.0"
  spec.add_development_dependency "mysql2", ">= 0.3.0"

  spec.add_development_dependency 'minitest', ">=  5.4.0"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "gem-release"

end
