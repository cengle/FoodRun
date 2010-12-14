Feature: Turn a recipe list into a meal plan
	As a user
	I want to be able to generate a searchable meal plan out of my current recipe list
	And allow the user to edit the name, description, and recipes in the meal plan
	
	Scenario: Generate meal plan from recipe list
		Given I have logged in
		And there are two recipes in the database
		And I have added those two recipes to my recipe list
		When I follow "My recipe list"
		And I follow "Make Meal Plan!"
		And I fill in "meal_plan_name" with "Test Meal Plan"
		And I fill in "meal_plan_description" with "Test meal plan description"
		And I press "Create"
		Then I should see "Test Meal Plan"
		And I should see "Number of recipes: 2"
	
	Scenario: Delete recipe from meal plan on create meal plan page
		Given I have logged in
		And there are two recipes in the database
		And I have added those two recipes to my recipe list
		When I follow "My recipe list"
		And I follow "Make Meal Plan!"
		And I delete the first recipes
		Then I should not see "Test Recipe 1" within ".new_mealplan_recipes"
		And I should see "Test Recipe 2"
	
	Scenario: Delete recipe from an existing meal plan
		Given I have logged in
		And I have made a test meal plan
		When I view the meal plan
		And I delete the second recipe
		Then I should not see "Test Recipe 2" within ".uploaded_recipe"
		And I should see "Test Recipe 1"
	
