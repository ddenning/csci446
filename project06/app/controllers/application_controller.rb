class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user, :namespaced_root

  before_filter { Authorization.current_user = current_user }

  private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
    	unless current_user
    		flash[:notice] = "You must be logged in to access that."
    		redirect_to root_url
    	end
    end

    def require_no_user
    	if current_user
    		flash[:notice] = "You must be logged out to acess that."
    		redirect_to root_url
    	end
    end

    def namespaced_root(user)
    if !user
      return root_url
    elsif user.role.name == "member"
      return member_root_url
    elsif user.role.name == "admin"
      return admin_root_url
    else
      return root_url
    end
  end
    
  protected

    def permission_denied
      flash[:error] = "You do not have access to that page."
      if current_user.role.name == "member"
        redirect_to member_root_url
      elsif current_user.role.name == "admin"
        redirect_to admin_root_url
      else
        redirect_to root_url
      end          
    end
end
