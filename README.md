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
* size of batch_of_lines_to_import  (integer, optional, defaults to 1000)


My applications-classes for processing data from external files inherit from Importeer.

```ruby
class ImporteerSomething < Importeer
	attr_accessor :my_var, :another_var
	#call importeer("filename") to import the file in batches of 1000, optional importeer("filename", size)

	def initialize(*)
		super
		@my_var = MyVar.all
		@another_var = AnotherVar.all
	end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. 

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/importeer_plan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
