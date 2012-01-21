class Player

	def play_turn(warrior)
		if @health == nil
			@health = 20
		end
		if @been_backward == nil
			if warrior.feel(:backward).captive?
				warrior.rescue!(:backward)
			else 
				if warrior.health < @health
					if warrior.feel(:backward).empty?
						warrior.walk!(:backward)
					else
						warrior.attack!(:backward)
					end
				else
					if warrior.feel(:backward).empty?
						warrior.walk!(:backward)
					else
						@been_backward = true;
					end
				end
			end
		end
		if @been_backward != nil
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
						if warrior.health < 20
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
		@health = warrior.health
  end
	
	def doBackwardStuff()
		if warrior.feel(:backward).captive?
			warrior.rescue!(:backward)
		else 
			if warrior.health < @health
				if warrior.feel(:backward).empty?
					warrior.walk!(:backward)
				else
					warrior.attack!(:backward)
				end
			else
				if warrior.feel(:backward).empty?
					warrior.walk!(:backward)
				else
					@been_backward = true;
				end
			end
		end
	end

	def doForwardStuff()
		if warrior.feel.captive?
				warrior.rescue!
		else
			if warrior.health < @health
				if warrior.feel(:backward).empty?
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
					if warrior.health < 20
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
