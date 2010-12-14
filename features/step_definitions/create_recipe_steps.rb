When /^I fill in title with Chicken Burrito$/ do
	fill_in(:title, :with => 'Chicken Burrito')
end


When /^I fill in Directions with make burrito$/ do
	fill_in(:directions, :with => 'make burrito')
end

When /^I fill in ingredient one's name with (.+)$/ do |arg|
	fill_in(:recipe[ingredient_amounts_attributes][0][ingredient_name], :with => arg)
end

When /^I fill in ingredient one's number with (\d+)$/ do |arg1|
	fill_in(:recipe_ingredient_amounts_attributes_0_number, :with => arg1)
end

When /^I fill in Completion time with (\d+) minutes$/ do |arg1|
	fill_in(:recipe_completion_time, :with => arg1)
end

When /^I press Create$/ do
	click_button('Create')
end

Then /^the Chicken Burrito recipe should be added to the database$/ do
	if response.respond_to? :should
		response.should contain('Chicken Burrito')
	else
		assert_contain 'Chicken Burrito'
	end
end


