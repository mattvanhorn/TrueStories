require 'spec_helper'

describe "routing for votes" do
  describe "upvoting" do
    it "routes correctly to votes#upvote" do
      { :get => "/upvote/42" }.should route_to( :controller => "votes", :action => "upvote", :story_id => "42")
    end
    it "is named correctly" do
      upvote_path(42).should == "/upvote/42"
    end
  end
  
  describe "downvoting" do
    it "routes correctly to votes#downvote" do
      { :get => "/downvote/42" }.should route_to( :controller => "votes", :action => "downvote", :story_id => "42")
    end
    it "is named correctly" do
      downvote_path(42).should == "/downvote/42"
    end
  end
end