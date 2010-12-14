Given /^I have added a recipe$/ do
	r = Recipe.create(:title => 'Test Recipe', 
		:description => 'This is a test recipe description')
end

Given /^I have added a recipe2$/ do
	r = Recipe.create(:title => 'Test Recipe2', 
		:description => 'This is a test recipe description')
end

When /^I click Show$/ do
	click_link('Show')
end

When /^I fill in review with this is a test review$/ do
	fill_in('review_review', :with => 'this is a test review')
end

When /^I select (\d+) stars$/ do |arg1|
	choose 'review_rating_5'
end

When /^I press Save Review$/ do
	click_button('Save Review')
end

Then /^I should see Rating (\d+)$/ do |arg1|
	response.should contain 'Rating: 4.0'
end
