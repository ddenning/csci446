class Player
  def play_turn(warrior)
		if @health == nil
			@health = 20
		end
		if warrior.feel.captive?
			warrior.rescue!
		else
			if warrior.health < @health
				if warrior.feel.empty?
					warrior.walk!
				else
					warrior.attack!
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
		@health = warrior.health
  end
end
