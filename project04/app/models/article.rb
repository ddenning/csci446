class Article < ActiveRecord::Base
	before_update :increment_edits

	def self.get_num_rows
		count
	end

	def increment_edits
		self[:num_edits] += 1
	end
end
