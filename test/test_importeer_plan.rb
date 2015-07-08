require 'minitest_helper'

class TestImporteerPlan < Minitest::Test

  	describe "test the gem" do
	    it "test that it has a version number" do
	     refute_nil ::ImporteerPlan::VERSION
	    end

	    it "test the obvious" do
	     assert true
	    end
	end



end
