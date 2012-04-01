When /^(?:they|I) should be on (.+)$/ do |page_name|
  location = URI.parse(current_url).path
  expected = path_to(page_name)
  if path_to(page_name).respond_to?(:match)
    expected.should match(location)
  else
    location.should == expected
  end
end

When /^(?:they|I) (?:visit|am on|are on|go to) (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^show me the page$/ do
  save_and_open_page
end