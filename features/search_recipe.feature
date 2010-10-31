Feature: Search for recipe by title
	In order to find existing recipes on the database
	As a user, I should be able to enter all or part
	of a recipe's name, and find the recipe along
	with all its information
	
	Scenario: find a recipe
		Given I am on the home page
		And the Chicken Burrito recipe is in the database
		When I fill in 'Search for recipe' field with Chicken Burrito
		And I click Search
		Then I should be on the search results page
		And I should see Chicken Burrito
	
	Scenario: don't find a recipe
		Given I am on the home page
		When I fill in 'Search for recipe' field with blahblahblah
		And I click Search
		Then I should be on the search results page
		And I should not see any recipes
