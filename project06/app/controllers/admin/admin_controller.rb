class Admin::AdminController < ApplicationController

	layout 'admin'
	before_filter :require_user
	filter_access_to :all

	def index
		@games = Game.paginate page: params[:page], order: 'created_at desc', per_page: 10
	end
	
end