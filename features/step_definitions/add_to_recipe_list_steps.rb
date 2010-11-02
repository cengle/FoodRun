Given /^I have created a recipe list$/ do
  visit '/recipe_lists/new'
  click_button('Create')
end

Given /^I have added a recipe to the recipe list named (.+)$/ do |recipe_name|
  visit '/recipes/new'
  fill_in(:title, :with => recipe_name)
  click_button('Create')
  click_link('Add to recipe list')
  click_link('Back')
end