# ImporteerPlan

The sole purpose of this gem is to provide the boilerplate code necessary to import and proces data from files for my applications.
This reduces duplication and eases maintenance.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'importeer_plan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install importeer_plan

## Usage

Importeer.new takes two options:

* name (string)
* an options-hash 
	
	* size of batch_of_lines_to_import  (size_batch, integer, optional, defaults to 1000)
	* type of separator for csv-files (sep, string, optional, defaults to ";")
	* method of import: initial or replacing (initial, false or true, optional, defaults to false)


My applications-classes for processing data from external files inherit from Importeer, depending the file-type:

* xls: ImporteerPlan::MyXls
* csv: ImporteerPlan::MyCsv
* txt: ImporteerPlan::MyTxt (todo)


```ruby
class ImporteerSomething < ImporteerPlan::MyXls
	attr_accessor :my_var, :another_var
	#call importeer("filename") to import the file in batches of 1000, optional importeer("filename", {size_batch: 1234})

	def initialize(*)
		super
		@my_var = MyVar.all
		@another_var = AnotherVar.all
	end
end
```


### methods

##### importeer

* commaf(string) where string is a dutch amount, separated by ',' turning to a float

* pointf(string) where string is a dutch amount, separated by '.' turning to a float

## Test
ImporteerPlan uses minitest.
Run rake to start the test-suite.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/importeer_plan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[![Gem Version](https://badge.fury.io/rb/importeer_plan.png)](http://badge.fury.io/rb/importeer_plan)