require "importeer_plan/version"

module ImporteerPlan
		class Importeer
		require 'spreadsheet'

		attr_accessor :path, :name, :dir, :size_batch
			#call importeer("filename") to import the file in batches of 1000, optional importeer("filename", size_)



			def initialize(name, size_batch = 1000)
				@name = name
				@path = File.absolute_path( Importeer.dir.join( @name ) )
				@size_batch = size_batch#||1000
			end

			def self.dir
				Rails.root.join('public/imports/')
			end

			def bron
			 	Spreadsheet.open(@path).worksheet(0).to_a.tap{|x| x.shift}.each_slice(size_batch).each
			end

			def importeer
				bron.each{|batch| importeer_batch batch}
			end

		end

end

