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

When /^(?:they|I) fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:they|I) click on "([^"]*)"$/ do |link_or_button|
  click_on(link_or_button)
end

Then /^(?:they|I) (should|should not) see "([^"]*)"$/ do |should_or_not, content|
  page.send should_or_not, have_content(content)
end

When /^(.*) within ([^:"]+)$/ do |scoped_step, scope|
  within(selector_for(scope)) do
    step(scoped_step)
  end
end

When /^(.*) within ([^:"]+):$/ do |scoped_step, scope, table_or_string|
  within(selector_for(scope)) do
    step("#{scoped_step}:", table_or_string)
  end
end