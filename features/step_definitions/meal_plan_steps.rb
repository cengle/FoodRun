Given /^there are two recipes in the database$/ do
	r1 = Recipe.create(:title => 'Test Recipe 1', 
		:description => 'This is a test recipe description')
	r2 = Recipe.create(:title => 'Test Recipe 2', 
		:description => 'This is another test recipe description')
end

Given /^I have added those two recipes to my recipe list$/ do
	visit '/'
	click_link("Test Recipe 1")
	click_link("Add to recipe list")
	visit '/'
	click_link("Test Recipe 2")
	click_link("Add to recipe list")
end

When /^I delete the first recipes$/ do
	visit '/meal_plans/removeRecipe/1?recipe_id=1'
end

Given /^I have made a test meal plan$/ do
	r1 = Recipe.create(:title => 'Test Recipe 1', 
		:description => 'This is a test recipe description')
	r2 = Recipe.create(:title => 'Test Recipe 2', 
		:description => 'This is another test recipe description')
	visit '/'
	click_link("Test Recipe 1")
	click_link("Add to recipe list")
	visit '/'
	click_link("Test Recipe 2")
	click_link("Add to recipe list")
	click_link("My recipe list")
	click_link("Make Meal Plan!")
	fill_in("meal_plan_name", :with => "Test Meal Plan")
	fill_in("meal_plan_description", :with => "Test meal plan description")
	click_button("Create")
end


When /^I view the meal plan$/ do
	visit 'meal_plans/1'
end

When /^I delete the second recipe$/ do
	  visit '/meal_plans/removeRecipeFromExisting/1?recipe_id=2'
end

