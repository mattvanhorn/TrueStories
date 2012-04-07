Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :identity, :fields => [:name, :email], :on_failed_registration => IdentitiesController.action(:new)
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

