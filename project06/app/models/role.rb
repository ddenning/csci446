class Role < ActiveRecord::Base
	has_many :users

	validates :name, presence: true
	validate :name_non_empty

	def name_non_empty
		unless self[:name].length >= 1
			errors.add(:name, " must be at least 1 character.")
		end
	end
end
