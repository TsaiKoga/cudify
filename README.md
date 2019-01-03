# Cudify

It's convinient for you.

This gem can help you quickly create, update or delete the records.

And it also supports accept_nested_attributes, for examples.

## Installation

Add this line to your application's Gemfile:

    gem 'cudify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cudify

## Usage
Firstly, it must add require cudify to your enviroment(in config/environment.rb):

    require "cudify"

This gem can help you quickly create, update or delete the records(you can try it by console), if you follow the rule below:

### CREATE RECORDS:
You just use the ActiveRecord method cudify or cudify!, the parameters is like the original records
example:

		User.cudify!(name: "TsaiKoga", sex: "man", age: 23)

### DESTROY RECORDS:
If you want to destroy records, the first thing is you need to know their ids, and set hash like them below:
example:

		User.cudify!(id:1, name:"TsaiKoga", _destroy: 1)
		User.cudify!([{id:1, name:"TsaiKoga", _destroy: 1}, {id:2, _destroy: 1}])

Remember: the symbol _destroy is important!

### UPDATE RECORDS:
If you want to update records, you must know their ids and put them into hash.
example:

		User.cudify!(name: "CKJ", sex: "man")

It also supports accept_nested_attributes, for examples:( user has many appliances )

### CREATE RECORDS WITH ACCEPT NESTED ATTRIBUTES:

	User.cudify!({name: "TsaiKoga", sex: "man", age: 23, 
		appliances_attributes: [{name: "labtop", price: 4300.0}, {name: "pen", price: 5}]
	})

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
