require 'spec_helper'

describe Story do
  include NullDB::RSpec::NullifiedDatabase

  subject { Fabricate.build(:story) }

  it "has a title" do
    subject.should have_db_column(:title).of_type(:string)
  end

  it "has a body" do
    subject.should have_db_column(:body).of_type(:text)
  end
end
