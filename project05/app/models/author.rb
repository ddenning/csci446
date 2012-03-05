class Author < ActiveRecord::Base
	has_many :articles, :dependent => :destroy
	validates :name, presence: true
	validate :name_cannot_be_pat

	has_attached_file :photo, :styles => { :portrait => "300x500>"}

	validates_attachment_size :photo, :less_than => 3.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def name_cannot_be_pat
		if self[:name] =~ /pat/i
			errors.add(:name, " cannot contain Pat")
		end
	end

end
