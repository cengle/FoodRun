Feature: Create and post a recipe
	In order to have a database of recipes, users
	should be able to create and post their recipes
	by specifying a name, list of ingredients, and 
	directions.
	
	Scenario: post recipe
		Given I am on the new recipe page
		When I fill in Title with Chicken Burrioto
		And I fill in Directions with make burrito
		And I fill in ingredient one's name with tortilla
		And I fill in ingredient one's number with 1
		And I fill in ingredient one's section with breads
		And I fill in ingredient two's name with shredded cheese
		And I fill in ingredient two's number with 2
		And I fill in ingredient two's unit with ounces
		And I fill in ingredient two's section with dairy
		And I fill in ingredient three's name with tomato
		And I fill in ingredient three's number with 1
		And I fill in ingredient three's section with produce
		And I fill in ingredient four's name with sour cream
		And I fill in ingredient four's number with 2
		And I fill in ingredient four's unit with tablespoons
		And I fill in ingredient four's section with dairy
		And I fill in ingredient five's name with salsa
		And I fill in ingredient five's number with 5
		And I fill in ingredient five's unit with ounces
		And I fill in ingredient five's section with condiments
		And I fill in Completion time with 10 minutes
		And I click Create
		Then the Chicken Burrito recipe should be added to the datab
		
