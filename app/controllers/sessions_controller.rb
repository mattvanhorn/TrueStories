class SessionsController < ApplicationController
  respond_to :html

  expose(:user){ current_user || User.new(params[:user]) }

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    if user.save
      sign_in(user)
      cookies.permanent.signed[:remember_me] = user.id
    end
    respond_with(user, :location => root_url)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def sign_in(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by_id(cookies.signed['remember_me'])
  end

  helper_method :current_user
end