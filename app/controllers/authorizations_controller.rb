class AuthorizationsController < ApplicationController
  before_filter :find_model

  def create

    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

    if authentication
      sign_in(authentication.user)

    elsif current_user
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."

    else
      user = User.new(:name => extract_username(omniauth), :email => extract_email(auth))
      user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      user.save!
      sign_in(user)

    end
    redirect_to root_url
  end

  private

  def omniauth
    request.env["omniauth.auth"]
  end

  def extract_username(auth)
    case auth['provider']
    when 'twitter'
      auth['info']['screen_name']
    else
      auth['info']['name']
    end
  end

  def extract_email(auth)
    nil
  end
end