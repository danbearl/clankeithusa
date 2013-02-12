# Givens
Given /^that product is in the cart\.$/ do
  visit product_path(@product)

  fill_in "quantity", :with => '2'
  
  click_button "Add To Cart"
end

Given /^I am on the cart page\.$/ do
  visit "/cart/"
end

Given /^I am on the products page\.$/ do
  visit products_path
end

Given /^I am on that product's page\.$/ do
  visit product_path(@product)
end

Given /^I am on that page\.$/ do
  visit "/#{@page.name}/"
end

Given /^I am on the log in page\.$/ do
  visit log_in_path
end

Given /^that user is logged in\.$/ do
  visit "/log_in/"

  fill_in "email", :with => @user.email
  fill_in "password", :with => "pass"

  click_button "Log In"
end

Given /^I am on the home page\.$/ do
  visit root_path
end

Given /^I am on the pages index\.$/ do
  visit pages_path
end

# Whens
When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

When /^I fill in the following:?/ do |form|
  rows = form.raw

  rows.each do |r|
    fill_in r[0], :with => r[1]
  end
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end

# Thens
Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should have_no_content text
end
