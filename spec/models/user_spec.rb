require 'spec_helper'

describe User do
  include NullDB::RSpec::NullifiedDatabase

  subject { Fabricate.build(:user) }

  describe "attributes" do
    it "has a name" do
      subject.should have_db_column(:name).of_type(:string)
    end

    it "has an email" do
      subject.should have_db_column(:email).of_type(:string)
    end

    it { should validate_presence_of(:email) }

    it { should have_accessible_attributes :name, :email }
  end

end
