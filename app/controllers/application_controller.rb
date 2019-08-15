class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_loging?, :current_user
  before_action :get_rooted, except: [:home]

  def is_loging?
    !!current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def get_rooted
    redirect_to root_path unless is_loging?
  end
end