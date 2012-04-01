require 'spec_helper'

describe "Routing for story pages" do

  it "routes the home page correctly" do
    { :get => "/" }.should route_to(:controller => "stories", :action => "index")
  end

end