class Authentication < ActiveRecord::Base
  attr_accessible :uid, :provider
  belongs_to :user

  def self.get_user_from_omniauth(auth)
    provider, uid = auth['provider'].to_s, auth['uid'].to_s
    authentication = find_by_provider_and_uid(provider, uid)
    if authentication
      return authentication.user if authentication
    else
      user = User.new do |u|
        u.nickname = auth['info']['name']
        u.authentications.build(:provider => provider, :uid => uid)
      end
      return user if user.save
    end
  end
end
