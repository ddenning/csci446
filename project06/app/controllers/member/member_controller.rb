class Member::MemberController < ApplicationController

	layout 'member'
	before_filter :require_user
	filter_access_to :all

	def index
		@games = current_user.games.paginate page: params[:page], order: 'created_at desc', per_page: 10
	end
	
end