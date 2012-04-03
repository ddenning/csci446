class User < ActiveRecord::Base
	acts_as_authentic

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
