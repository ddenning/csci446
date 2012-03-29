class UserSessionsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @user_session = UserSession.new
  end

  def edit
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def update  	
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
end
