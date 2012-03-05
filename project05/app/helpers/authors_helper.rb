module AuthorsHelper
	def truncate_title(str)
		if str.size >= 20
			str.slice(0, 17) << "..."
		else
			str
		end
	end

	def sort_articles(articles)
		articles.sort {|a, b| b.created_at <=> a.created_at}
	end

	def first_article(articles)
		sort_articles(articles)[0]
	end
end
