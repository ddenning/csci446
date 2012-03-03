class Author < ActiveRecord::Base
	belongs_to :article

	has_attached_file :photo, :styles => { :portrait => "500x300>" }

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 3.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
