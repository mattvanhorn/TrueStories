class Authentication < ActiveRecord::Base
  attr_accessible :uid, :provider
  belongs_to :user

  def self.get_user_from_omniauth(auth)
    authentication = find_by_provider_and_uid(auth['provider'], auth['uid'])
    if authentication
      return authentication.user if authentication
    else
      user = User.new do |u|
        case auth['provider']
        when 'twitter'
          u.nickname = auth['info']['screen_name']
          u.authentications.build(:provider => auth['provider'], :uid => auth['uid'])
        when 'github'
          raise auth.inspect
        end
      end
      return user if user.save
    end
  end
end
