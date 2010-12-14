Given /^I have created a recipe list$/ do
  visit '/recipe_lists/new'
  click_button('Create')
end

Given /^I have added a recipe to the recipe list named (.+)$/ do |recipe_name|
  Recipe.create(:title => 'Chicken Burrito', :description=> 'blah blah blah')
end

Given /^I have logged in$/ do
  visit 'users/new'
  fill_in(:user_username, :with => 'user')
  fill_in(:user_email, :with => 'user@user.com')
  fill_in(:user_password, :with => 'password')
  fill_in(:user_password_confirmation, :with => 'password')
  click_button('Create')
end