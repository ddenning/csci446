module ArticlesHelper
	def display_beginning_body(str)
		if str.size >= 68
			str.slice(0, 65) << "..."
		else
			str
		end
	end

	def display_beginning_title_or_author(str)
		if str.size >= 15
			str.slice(0, 12) << "..."
		else
			str
		end
	end

	def sort_articles(articles)
		articles.sort {|a, b| b.created_at <=> a.created_at}
	end
end
