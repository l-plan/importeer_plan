require 'minitest_helper'

class TestImporteer < Minitest::Test





  	describe "Importeer" do	
  		let(:importeer) { ImporteerPlan::Importeer.new('testje.xls') }

	    it "test that importeer exists" do
	     refute_nil importeer
	    end

	    it "test name of the file" do
	     importeer.name.must_equal 'testje.xls'
	    end

	 	it "test if it has default-options" do
	 		importeer.sep.must_equal ";"
	 		importeer.initial.must_equal false
	 		importeer.size_batch.must_equal 1000
	 	end

	    it "test size of batch when declared" do
	     ImporteerPlan::Importeer.new('testje.xls', {size_batch: 123} ).size_batch.must_equal 123
	    end

	    it "test the first line of the file" do
	     Spreadsheet.open(importeer.path).worksheet(0).row(0).to_a.must_equal ['A', 'B', 'C', 'D', 'E', 'F']
	 	end

	 	it "test dutch string-comma-separated amount to float" do
	 		importeer.commaf('1,2375').must_equal 1.24
	 	end

	 	it "test dutch string-point-separated amount to float" do
	 		importeer.commaf('1.2375').must_equal 1.24
	 	end


	end

  	describe "Importeer" do	
  		let(:importeer) { ImporteerPlan::Importeer.new('testje.xls', {size_batch: 123, sep: "$", initial: true}) }

	    it "test that importeer exists" do
	     refute_nil importeer
	    end

	    it "test name of the file" do
	     importeer.name.must_equal 'testje.xls'
	    end

	 	it "test size of batch" do
	 		importeer.size_batch.must_equal 123
	 	end

	 	it "test type of sep" do
	 		importeer.sep.must_equal "$"
	 	end

	 	it "test type of importfile" do
	 		importeer.initial.must_equal true
	 	end


	end


  	describe "MyXls" do	
  		let(:xls) { ImporteerPlan::MyXls.new('testje.xls') }

	    it "test that importeer exists" do
	     refute_nil xls
	    end

	    it "test name of the file" do
	     xls.name.must_equal 'testje.xls'
	    end

	    it "test size of batch" do
	     xls.size_batch.must_equal 1000
	    end

	    it "test size of batch when declared" do
	     ImporteerPlan::MyXls.new('testje.xls', {size_batch: 123} ).size_batch.must_equal 123
	    end

	    it "test the first line of the file" do
	     Spreadsheet.open(xls.path).worksheet(0).row(0).to_a.must_equal ['A', 'B', 'C', 'D', 'E', 'F']
	 	end





	end
 
  	describe "MyCsv" do	
  		let(:csv) { ImporteerPlan::MyCsv.new('testje.csv') }

	    it "test that importeer exists" do
	     refute_nil csv
	    end

	    it "test name of the file" do
	     csv.name.must_equal 'testje.csv'
	    end

	    it "test size of batch" do
	     csv.size_batch.must_equal 1000
	    end

	    it "test size of batch when declared" do
	     # ImporteerPlan::MyXls.new('testje.csv', 123).size_batch.must_equal 123
	    end

	    it "test the first line of the file" do
	     # Spreadsheet.open(xls.path).worksheet(0).row(0).to_a.must_equal ['A', 'B', 'C', 'D', 'E', 'F']
	 	end




	end

end

