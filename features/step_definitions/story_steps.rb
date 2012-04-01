Then /^I should see the newest story first$/ do
  expected = Story.order('created_at DESC').first
  page.should have_selector('li.story', :count => 2)
  page.first('li.story', :text => /#{expected.body}/).should_not be_nil
end