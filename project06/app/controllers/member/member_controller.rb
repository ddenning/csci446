class Member::MemberController < ApplicationController

	layout 'member'
	before_filter :require_user
	filter_access_to :all

	def index
		@games = current_user.games
	end
	
end