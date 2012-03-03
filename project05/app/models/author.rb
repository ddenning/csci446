class Author < ActiveRecord::Base
	belongs_to :article

	has_attached_file :photo, :styles => { :portrait => "500x300>" }
end
