module AuthorsHelper
	def truncate_title(str)
		if str.size >= 20
			str.slice(0, 17) << "..."
		else
			str
		end
	end
end
