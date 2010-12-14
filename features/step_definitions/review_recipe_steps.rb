Given /^I have added a recipe$/ do
	visit '/recipes/new'
	fill_in(:title, :with => 'Chicken Burrito')
	fill_in(:description, :with => 'yummy chicken')
	click_button('Upload Recipe')
	click_link('Back')
end

When /^I click Show$/ do
	click_link('Show')
end

When /^I click Add Review$/ do
	click_link('Add Review')
end

Then /^I should see the new review form$/ do
	if response.respond_to? :should
		response.should contain('New review')
	else
		assert_contain 'New review'
	end
end


Given /^I am entering a recipe review$/ do
	visit '/recipes/new'
	fill_in(:title, :with => 'Chicken Burrito')
	click_button('Create')
	click_link('Back')
	visit path_to('the home page')
	click_link('Chicken Burrito')
	click_link('Add Review')
end


When /^I fill in Title with Best recipe evar$/ do
	fill_in(:title, :with => 'Best recipe evar')
end

When /^I fill in Review with title says it all$/ do
	fill_in(:review, :with => 'Best recipe evar')
end

When /^I fill in rating with (\d+)$/ do |arg1|
  	fill_in(:rating, :with => arg1)
end

When /^click Create$/ do
	click_button('Create')
end

Then /^I should see Review successfully created$/ do
	if response.respond_to? :should
		response.should contain('Review was successfully created.')
	else
		assert_contain 'Review was successfully created.'
	end
end


