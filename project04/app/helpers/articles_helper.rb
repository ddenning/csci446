module ArticlesHelper
	def display_beginning(str)
		if str.size >= 68
			str.slice(0, 65) << "..."
		else
			str
		end
	end
end
