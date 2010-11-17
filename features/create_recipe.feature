Feature: Create and post a recipe
	In order to have a database of recipes, users
	should be able to create and post their recipes
	by specifying a name, list of ingredients, and 
	directions.
	
	Scenario: post recipe
		Given I am on the create recipe page
		When I fill in title with Chicken Burrito
		And I fill in Directions with make burrito
		And I fill in ingredient one's name with tortilla
		And I fill in ingredient one's number with 1		
		And I fill in Completion time with 10 minutes
		And I press Create
		Then the Chicken Burrito recipe should be added to the database
		
		
		
		
		
