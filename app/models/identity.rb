class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :name, :password_digest
  belongs_to :user
  
  def self.create_with_omniauth(auth)
    Identity.create! do |identity|
      identity.provider = auth["provider"]
      identity.uid = auth["uid"]
      identity.name = auth["info"]["name"]
    end
  end
  
end
