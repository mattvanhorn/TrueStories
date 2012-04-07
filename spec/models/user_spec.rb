require 'spec_helper'

describe User do
  include NullDB::RSpec::NullifiedDatabase

  subject { Fabricate.build(:user) }

  describe "attributes" do
    it "has a name" do
      subject.should have_db_column(:nickname).of_type(:string)
    end

    it { should have_accessible_attributes :nickname }
  end

  describe "being created via omniauth" do
    let!(:existing_user){ mock_model(User, :nickname => 'Existing Alice')}
    let!(:identity){ stub_model(Identity, :name => 'Alice Identity', :email => 'alice@example.com') }
    let!(:auth){{'uid' => '42', 'info' => {'name' => 'Auth Alice', 'email' => 'alice@example.com'}}}

    it "provides a user via identity" do
      auth['provider'] = 'identity'
      Identity.should_receive(:get_user_from_omniauth).with(auth).and_return(existing_user)
      User.from_omniauth(auth)
    end

    it "provides a user via authentication" do
      auth['provider'] = 'twitter'
      Authentication.should_receive(:get_user_from_omniauth).with(auth).and_return(existing_user)
      User.from_omniauth(auth)
    end

  end
end
