$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
ENV["RAILS_ENV"] = "test"

# require File.expand_path("../dummy/config/environment.rb",  __FILE__)
# require "rails/test_help"

# Rails.backtrace_cleaner.remove_silencers!

# # Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# # Load fixtures from the engine
# if ActiveSupport::TestCase.method_defined?(:fixture_path=)
#   ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
# end



require 'importeer_plan'

require 'minitest/autorun'

require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new] 

class Minitest::Test

@@file = file
# end

# def eenmalig
# 	puts 'eenmalig'
# end

def initialize(*)
	super

end
	
 # setup do
 #    sign_in :user, users(:one)
 # #  end

 # @@file = do {puts 'eenmalig.......'}
			def self.file
				doel = Spreadsheet::Workbook.new
				doel.create_worksheet :name => 'testje'
				testje = doel.worksheet(0)


				testje.insert_row(0,%w(A B C D E F))
				testje.insert_row(1, %w(a b c d e f))

				doel.write( Rails.root.join('public/imports/testje.xls') )
				puts 'setting up...'

			end
# def	self.before_suites

end