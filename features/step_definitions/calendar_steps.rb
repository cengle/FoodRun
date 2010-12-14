Given /^I have uploaded a recipe named "([^"]*)"$/ do |recipe_name|
  visit '/recipes/new'
  fill_in(:title, :with => recipe_name)
  fill_in(:description, :with => 'foodrun rocks')
  click_link('<span> Upload Recipe </span>')
end
