require 'importeer_plan'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path('../dummy/config/environment.rb',  __FILE__)

ENV["RAILS_ENV"] = "test"

require 'rails/test_help'


require 'minitest/autorun'

require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new] 

class Minitest::Test


	def setup
		return if  File.exist?( Rails.root.join('public/imports/testje.xls')  )

		doel = Spreadsheet::Workbook.new
		doel.create_worksheet :name => 'testje'
		testje = doel.worksheet(0)


		testje.insert_row(0,%w(A B C D E F))
		testje.insert_row(1, %w(a b c d e f))

		doel.write( Rails.root.join('public/imports/testje.xls') )

		doel = CSV.open(Rails.root.join('public/imports/testje.csv'), "wb", col_sep: ";") do |csv|
		 csv <<  %w(A B C D E F)
		 csv <<  %w(a b c d e f)
		  # ...
		end

		doel.close if !doel.closed?

	end


	Minitest.after_run { File.delete( Rails.root.join('public/imports/testje.xls')  ) if File.exist?( Rails.root.join('public/imports/testje.xls') ) }
	Minitest.after_run { File.delete( Rails.root.join('public/imports/testje.csv')  ) if File.exist?( Rails.root.join('public/imports/testje.csv') ) }

end
