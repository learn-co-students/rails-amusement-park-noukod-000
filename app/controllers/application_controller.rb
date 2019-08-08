class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login?,:current_user
  def authentification_required
      if !login?
        redirect_to root_path
      end
  end

  def login?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def home
  end
end
