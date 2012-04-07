class User < ActiveRecord::Base
  attr_accessible :nickname

  has_one :identity
  has_many :authorizations

  make_voter

  def self.create_with_omniauth(auth)
    create! do |user|
      user.identity = Identity.find_from_omniauth(auth)
      user.nickname = user.identity.name
    end
  end

  def self.from_omniauth(auth)
    case auth['provider']
    when 'identity'
      identify = Identity.find_from_omniauth(auth)
      if identify
        return identify.user || User.create!(:nickname => identify.name){|u| u.identity = identify}
      end
    else
      raise 'unknown provider'
    end
  end

end
