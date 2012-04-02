require 'spec_helper'

describe "Routing for story pages" do

  it "routes the callback page correctly" do
    { :get => "/auth/developer/callback" }.should route_to(:controller => "sessions", :action => "create", :provider => 'developer')
  end

end
