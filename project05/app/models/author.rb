class Author < ActiveRecord::Base
	has_many :article

	validates :name, presence: true
	validate :name_cannot_be_pat

	has_attached_file :photo, :styles => { :portrait => "300x500>" }

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 3.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def name_cannot_be_pat
		if self[:name] =~ /pat/i
			errors.add(:name, " cannot contain Pat")
		end
	end

	def get_relevent_articles
		articles = []
		Article.all.each do |article|
      if article.author == :name
      	articles.add(article)
      end
    end
	end
end
