Feature: View recipe list as a list of ingredients
	In order to know what ingredients to buy
	As a user
	I want to be able to see my list of recipes as a list of ingredients
	
	Scenario: Add two recipes and view the grocery list
		Given I have logged in
		And I have added two recipes that have 1 and 2 units of ingredient test
		And I am on the home page
		When I follow "Test Recipe 1"
		And I follow "Add to recipe list"
		And I am on the home page
		And I follow "Test Recipe 2"
		And I follow "Add to recipe list"
		And I follow "My recipe list"
		And I follow "Show Grocery List" 
		Then I should see "Grocery list"
		And I should see "test"
		And I should see "3.0"
