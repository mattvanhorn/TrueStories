class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_id(session[:user_id] || cookies.signed['remember_me'])
  end

  helper_method :current_user
end
