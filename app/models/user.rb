class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :email, :presence =>  true

  has_many :identities

  make_voter

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by_email(auth_hash['uid'])
  end

  def self.from_omniauth(auth)
    identify = Identity.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Identity.create_with_omniauth(auth)
    identify.user || User.create! {|user| user.identities <<  identify}
  end

end
