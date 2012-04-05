class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id] || cookies.signed['remember_me'])
  end

  def sign_in(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] =  cookies.permanent.signed[:remember_me] =  @current_user = nil
  end

end
