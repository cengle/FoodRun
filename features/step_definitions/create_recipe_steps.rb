When /^I fill in title with Chicken Burrito$/ do
	fill_in(:title, :with => 'Chicken Burrito')
end


When /^I fill in Directions with make burrito$/ do
	fill_in(:directions, :with => 'make burrito')
end

When /^I fill in ingredient one's name with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_0_name, :with => arg)
end

When /^I fill in ingredient one's number with (\d+)$/ do |arg1|
	fill_in(:recipe_ingredients_attributes_0_number, :with => arg1)
end

When /^I fill in ingredient one's section with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_0_section, :with => arg)
end



When /^I fill in ingredient two's name with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_1_name, :with => arg)
end

When /^I fill in ingredient two's number with (\d+)$/ do |arg1|
	fill_in(:recipe_ingredients_attributes_1_number, :with => arg1)
end

When /^I fill in ingredient two's unit with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_1_unit, :with => arg)
end

When /^I fill in ingredient two's section with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_1_section, :with => arg)
end



When /^I fill in ingredient three's name with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_2_name, :with => arg)
end

When /^I fill in ingredient three's number with (\d+)$/ do |arg1|
	fill_in(:recipe_ingredients_attributes_2_number, :with => arg1)
end

When /^I fill in ingredient three's section with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_2_section, :with => arg)
end



When /^I fill in ingredient four's name with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_3_name, :with => arg)
end

When /^I fill in ingredient four's number with (\d+)$/ do |arg1|
	fill_in(:recipe_ingredients_attributes_3_number, :with => arg1)
end

When /^I fill in ingredient four's unit with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_3_unit, :with => arg)
end

When /^I fill in ingredient four's section with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_3_section, :with => arg)
end



When /^I fill in ingredient five's name with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_4_name, :with => arg)
end

When /^I fill in ingredient five's number with (\d+)$/ do |arg1|
	fill_in(:recipe_ingredients_attributes_4_number, :with => arg1)
end

When /^I fill in ingredient five's unit with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_4_unit, :with => arg)
end

When /^I fill in ingredient five's section with (.+)$/ do |arg|
	fill_in(:recipe_ingredients_attributes_4_section, :with => arg)
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


