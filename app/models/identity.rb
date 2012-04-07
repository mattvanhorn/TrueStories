class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  belongs_to :user

  def self.find_from_omniauth(auth)
    find_by_id(auth['uid'])
  end

end
