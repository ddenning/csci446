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
		count1 = 0
    user.games.each do |game|
      unless game.rating
        count1 += 1
      end
    end
		if count != 0
			return 100 * (count - count1) / count
		else
			return 0
		end
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
