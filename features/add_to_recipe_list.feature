Feature: Add recipe to recipe list
	In order to aggregate recipes into a list
	As a user
	I want to be able to add recipes to a global recipe list
	
	Scenario: Add a recipe
		Given I have logged in 
		And I have added a recipe
		And I follow "foodrun"
		When I follow "Test Recipe"
		And I follow "Add to recipe list"
		Then I should see "Test Recipe was added to the recipe list."