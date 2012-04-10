module GamesHelper
	def sort_games(games)
		games.sort {|a, b| b.created_at <=> a.created_at}
	end
end
