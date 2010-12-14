Given /^I have added a cookie recipe to the recipe list named "([^"]*)"$/ do |recipe_name|
  visit '/recipes/new'
  fill_in(:title, :with => recipe_name)
  fill_in(:description, :with => 'blah blah blah description')
  click_link('Upload Recipe')
end