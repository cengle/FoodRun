Feature: Add recipe to recipe list
	In order to aggregate recipes into a list
	As a user
	I want to be able to add recipes to a global recipe list
	
	Scenario: Add a recipe
		Given I have logged in 
		And I have added a recipe
		And I am on the home page
		When I follow "Chicken Burrito"
		And I follow "Add to recipe list"
		Then I should see "Chicken Burrito was added to the recipe list."