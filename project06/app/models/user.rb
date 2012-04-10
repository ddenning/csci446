class User < ActiveRecord::Base
	acts_as_authentic do |c|
		c.merge_validates_length_of_password_confirmation_field_options :minimum => 6
		c.merge_validates_length_of_password_field_options :minimum => 6
		c.merge_validates_length_of_login_field_options :within => 6..100
	end

	belongs_to :role
	has_many :games

	has_attached_file :photo, :styles => { :portrait => "300x500>" }

	validates :first_name, :last_name, presence: true

	def full_name
		return first_name + " " + last_name
	end

	def role_symbols
		[role.name.downcase.to_sym]
	end
end
