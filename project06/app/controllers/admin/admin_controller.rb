class Admin::AdminController < ApplicationController

	layout 'admin'
	before_filter :require_user
	filter_access_to :all

	def index
		@games = Game.all
	end
	
end