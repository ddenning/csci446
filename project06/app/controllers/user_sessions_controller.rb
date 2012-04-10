class UserSessionsController < ApplicationController

  layout 'public'
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy]

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Welcome back  #{@user_session.user.first_name} #{@user_session.user.last_name}"
      redirect_to namespaced_root(@user_session.user)
    else
      render :action => :new
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
end
