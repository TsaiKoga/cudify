# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cudify/version'

Gem::Specification.new do |spec|
  spec.name          = "cudify"
  spec.version       = Cudify::VERSION
  spec.authors       = ["TsaiKoga"]
  spec.email         = ["969024089@qq.com"]
  spec.description   = %q{
		It's convinient for you to quickly create, update or delete the records.
		And it also supports accept_nested_attributes.
	}
  spec.summary       = %q{This gem is used to create, delete or update records.}
  spec.homepage      = "http://github.com/tsaikoga/cudify"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
