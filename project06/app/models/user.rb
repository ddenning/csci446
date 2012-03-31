class User < ActiveRecord::Base
	acts_as_authentic

	has_attached_file :photo, :styles => { :portrait => "300x500>" }

	validates :first_name, :last_name, presence: true
end
