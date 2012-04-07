require 'spec_helper'

describe SessionsController do

  describe "handling an identity login" do

    let(:env){ {'omniauth.auth' => {'uid' => '42', 'provider' => 'identity', 'info' => {'name' => 'Alice', 'email' => 'alice@example.com'}}}}
    let(:user){ mock_model(User) }
    before(:each) do
      request.stub(:env => env.merge('action_dispatch.secret_token' => 'f9b251da1ad57e4998a0eb10475e169c')) #need token for cookies
    end

    it "looks up the identity" do
      User.should_receive(:from_omniauth).and_return(user)
      post :create
    end

  end

end
