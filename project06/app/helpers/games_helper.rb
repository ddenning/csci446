module GamesHelper
	def sort_games(games)
		games.sort {|a, b| b.created_at <=> a.created_at}
	end

	def display_user(user)
		if user == current_user
			return "Me"
		else
			return user.full_name
		end
	end

	def percent_rated(user)
		count = user.games.count
		100 * (count - user.games.find_all_by_rating("").count) / count
	end

	def count_games(games)
		games.count
	end

	def display_edit?(game)
		if game.user == current_user
			return true
		else
			return false
		end
	end
end
