class Article < ActiveRecord::Base
	validates :title, :author, :body, presence: true
	validates :author, allow_blank: true, format: {
		with: /[^pat]/i,
		message: 'No authors with the name Pat are allowed.'
	}
	before_update :increment_edits

	def get_paragraphs
		(self[:body]).split("\n")
	end
	
	def self.get_num_rows
		count
	end

	def increment_edits
		self[:num_edits] += 1
	end
end
