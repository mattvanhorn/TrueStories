class User < ActiveRecord::Base
  attr_accessible :nickname

  has_one :identity
  has_many :authentications

  make_voter

  def self.from_omniauth(auth)
    case auth['provider']
    when 'identity'
      Identity.get_user_from_omniauth(auth)
    else
      Authentication.get_user_from_omniauth(auth)
    end
  end

  def has_auth?(provider)
    authentications.map(&:provider).include?(provider)
  end
  
  def add_authentication(auth)
    provider, uid = auth['provider'].to_s, auth['uid'].to_s
    authentications.build(:provider => provider, :uid => uid)
  end
end
