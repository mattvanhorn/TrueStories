require 'spec_helper'

describe "Routing for story pages" do

  it "routes the callback page correctly" do
    { :get => "/auth/developer/callback" }.should route_to(:controller => "sessions", :action => "create", :provider => 'developer')
  end

  it "routes the callback page correctly" do
    { :get => "/auth/twitter/callback" }.should route_to(:controller => "sessions", :action => "create", :provider => 'twitter')
  end

  it "routes the callback page correctly" do
    { :get => "/auth/github/callback" }.should route_to(:controller => "sessions", :action => "create", :provider => 'github')
  end

end
