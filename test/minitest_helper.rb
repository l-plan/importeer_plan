$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
ENV["RAILS_ENV"] = "test"


require 'importeer_plan'

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

	end


	Minitest.after_run { File.delete( Rails.root.join('public/imports/testje.xls')  ) }

end

