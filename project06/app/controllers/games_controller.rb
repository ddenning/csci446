class GamesController < ApplicationController

  layout 'public'

  filter_access_to :all
  # GET /games
  # GET /games.json
  def index
    @games = Game.paginate page: params[:page], order: 'created_at desc', per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end
end
