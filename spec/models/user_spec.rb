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
    let!(:auth){{'uid' => '42', 'provider' => 'identity', 'info' => {'name' => 'Auth Alice', 'email' => 'alice@example.com'}}}

    it "finds an existing user" do
      identity.stub(:user => existing_user)
      Identity.should_receive(:find_from_omniauth).with(auth).and_return(identity)
      user = User.from_omniauth(auth)
      user.nickname.should == 'Existing Alice'
      user.should_not be_new_record
    end

    it "creates a new user" do
      identity.stub(:user => nil)
      Identity.should_receive(:find_from_omniauth).with(auth).and_return(identity)
      user = User.from_omniauth(auth)
      user.nickname.should == 'Alice Identity'
      user.should_not be_new_record
    end

    it "returns nil, if no identity exists" do
      Identity.should_receive(:find_from_omniauth).with(auth).and_return(nil)
      user = User.from_omniauth(auth)
      user.should be_nil
    end
  end
end
