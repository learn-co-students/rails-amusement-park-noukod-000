class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def authentification_required
      if !login?
        redirect_to root_path
      end
  end

  def login?
    session[:user_id]
  end
  
  def home
  end
end
