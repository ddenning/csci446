class Player

	def play_turn(warrior)
		if @health == nil
			@health = 20
		end
		if @pivot == nil
			warrior.pivot!
			@pivot = true
		else
			act(warrior)
		end
		@health = warrior.health
  end

	def act(warrior)
		if warrior.feel.captive?
			warrior.rescue!
		else
			if warrior.health < @health
				if warrior.health < 10 and warrior.feel(:backward).empty?
					warrior.walk!(:backward)
				else
					if warrior.feel.empty?
						warrior.walk!
					else
						warrior.attack!
					end
				end
			else
				if warrior.feel.empty?
					if warrior.health < 19
						warrior.rest!
					else
						warrior.walk!
					end
				else
					warrior.attack!
				end
			end
		end
	end
end
