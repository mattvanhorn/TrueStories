require 'spec_helper'

describe Identity do
  let(:auth){ {'uid' => '123', 'provider' => 'identity', 'info' => {'name' => 'Alice', 'email' => 'alice@example.com'}}}

  it "finds from auth hash" do
    Identity.should_receive(:find_by_id).with('123')
    Identity.find_from_omniauth(auth)
  end
end
