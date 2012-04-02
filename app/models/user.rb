class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates :email, :presence =>  true

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by_email(auth_hash['uid'])
  end
end
