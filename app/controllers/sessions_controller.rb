class SessionsController < ApplicationController
  respond_to :html

  expose(:user){ current_user || User.new(params[:user]) }

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    if user.save
      sign_in(user)
      cookies.permanent.signed[:remember_me] = user.id
      redirect_to root_url and return
    end
    redirect_to root_url, alert: "Authentication failed, please try again."
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end