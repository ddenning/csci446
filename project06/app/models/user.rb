class User < ActiveRecord::Base
	acts_as_authentic

	has_attached_file :photo, :styles => { :portrait => "300x500>" }
end
