Given /^I am viewing the recipe named "([^"]*)"$/ do |recipe_name|
  visit '/recipes'
  click_link(recipe_name)
end

Given /^I add a review with a rating of "([^"]*)"$/ do |recipe_name|
  click_link('Add Review')
  fill_in(:review_rating, :with => recipe_name)
  click_button('Create')
end