class Article < ActiveRecord::Base
	validates :title, :author, :body, presence: true
	validate :author_cannot_be_pat
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

	def author_cannot_be_pat
		if self[:author] =~ /pat/i
			errors.add(:author, " cannot contain Pat")
		end
	end
end
