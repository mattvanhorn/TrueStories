class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  belongs_to :user

  def self.get_user_from_omniauth(auth)
    if (identify = find_by_id(auth['uid']))
      return identify.user || User.create!(:nickname => identify.name){|u| u.identity = identify}
    end
  end

end
