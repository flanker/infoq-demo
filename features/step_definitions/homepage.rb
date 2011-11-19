When /^I visit the home page$/ do
  visit ""
end

Then /^I can see the "([^"]*)" message$/ do |message|
  page.should have_content message
end
