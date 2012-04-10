module UsersHelper
	def sort_users(users)
		users.sort {|a, b| a.last_name <=> b.last_name}
	end
end
