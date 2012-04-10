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
end
