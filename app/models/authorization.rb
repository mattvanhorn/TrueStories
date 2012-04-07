class Authorization < ActiveRecord::Base
  attr_accessible :uid, :provider
  belongs_to :user

  def self.find_from_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end
  

end