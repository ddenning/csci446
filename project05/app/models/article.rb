class Article < ActiveRecord::Base
	belongs_to :authors, dependent: :destroy
	validates :title, :author, :body, presence: true
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
