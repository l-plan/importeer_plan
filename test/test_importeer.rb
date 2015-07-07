require 'minitest_helper'

class TestImporteer < Minitest::Test



  	describe "test that it has a version number" do

			# before do
			# 	doel = Spreadsheet::Workbook.new
			# 	doel.create_worksheet :name => 'testje'
			# 	testje = doel.worksheet(0)


			# 	testje.insert_row(0,%w(A B C D E F))
			# 	testje.insert_row(1, %w(a b c d e f))

			# 	doel.write( Rails.root.join('public/imports/testje.xls') )
			# 	puts 'setting up...'

			# end

			# after do
			# 	File.delete( Rails.root.join('public/imports/testje.xls') )
			# end

	    it "test the obvious" do
	     refute_nil ::ImporteerPlan::VERSION
	    end

	    it "test the obvious" do
	     refute_nil ::ImporteerPlan::VERSION
	    end


	end

 

end