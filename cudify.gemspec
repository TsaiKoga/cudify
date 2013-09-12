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
		It's convinient for you.
		This gem can help you quickly create, update or delete the records, if you follow the rule below:
		CREATE RECORDS:
		  You just use the ActiveRecord method cudify or cudify!, the parameters is like the original records
			example:
				User.cudify!(name: "TsaiKoga", sex: "man", age: 23)
		DESTROY RECORDS:
		  If you want to destroy records, the first thing is you need to know their ids, and set hash like them below:
			example:
				User.cudify!(id:1, name:"TsaiKoga", _destroy: 1)
			Remember: the symbol _destroy is important!
		UPDATE RECORDS:
			If you want to update records, you must know their ids and put them into hash.
			example:
				User.cudify!(name: "CKJ", sex: "man")
	}
  spec.summary       = %q{This gem is used to create, delete or update records.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
