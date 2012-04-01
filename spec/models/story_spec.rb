require 'spec_helper'

describe Story do
  include NullDB::RSpec::NullifiedDatabase

  subject { Fabricate.build(:story) }

  describe "attributes" do
    it "has a title" do
      subject.should have_db_column(:title).of_type(:string)
    end

    it "has a body" do
      subject.should have_db_column(:body).of_type(:text)
    end

    [:body, :title].each do |attr|
      it { should validate_presence_of(attr) }
    end

    it { should have_accessible_attributes :title, :body }
  end

end
