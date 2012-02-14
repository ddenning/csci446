class Article < ActiveRecord::Base
	def self.get_num_rows
		count
	end
end
