Given /^I have added a cookie recipe to the recipe list named "([^"]*)"$/ do |recipe_name|
  visit '/recipes/new'
  fill_in(:title, :with => recipe_name)
  fill_in(:name, :with => 'cookie dough')
  fill_in(:number, :with => 5)
  fill_in(:unit, :with => 'pounds')
  click_button('Create')
  click_link('Add to recipe list')
  click_link('Back')
end