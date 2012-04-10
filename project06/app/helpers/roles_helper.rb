module RolesHelper
	def sort_roles(roles)
		roles.sort {|a, b| a.name <=> b.name}
	end
end
