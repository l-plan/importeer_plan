require "importeer_plan/version"
require 'importeer_plan/configuration'

module ImporteerPlan
		class Importeer
		

		attr_accessor :path, :name, :dir, :size_batch, :sep, :initial, :options
			#call importeer("filename") to import the file in batches of 1000, optional importeer("filename", size_)



			def initialize(name, options={})
				@options = options
				@name = name
				@path = Importeer.dir.join( @name ) 
				@size_batch = options[:size_batch]||1000
				@sep = options[:sep]|| ";"
				@initial = options[:initial]|| false
			end

			def self.dir
				# Rails.root.join('public/imports/')

				ImporteerPlan.configuration.dir

			end

			def bron
			end

			def sweep
			end

			def importeer
				sweep
				bron.each{|batch| importeer_batch batch}
			end

			def commaf(str) # comma-float; "1,234" 
				   ('%.2f' % str.gsub(',', '.') ).to_f
			end

			def pointf(str) # point-float; "1.234"
				   ('%.2f' % str.gsub(',', '.') ).to_f
			end

		end

		class MyXls < Importeer
			require 'spreadsheet'
			def initialize(*)
				super
			end

			def bron
			 	Spreadsheet.open(@path).worksheet(0).to_a.tap{|x| x.shift}.each_slice(size_batch).each
			end
		end

		class  MyCsv< Importeer
			require 'csv'
			def initialize(*)
				super
				# @sep = options[:sep]
			end

			def bron
			 	CSV.read(path, { :col_sep => @sep , :encoding => "ISO-8859-1"}).tap{|x| x.shift}.each_slice(@size_batch)
			end
		end

		class  MyTxt< Importeer
			def initialize(*)
				super
			end

			def bron
			 	# Csv.open(@path).worksheet(0).to_a.tap{|x| x.shift}.each_slice(size_batch).each
			end
		
		end
end

