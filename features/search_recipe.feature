Feature: Search for recipe by title
	In order to find existing recipes on the database
	As a user, I should be able to enter all or part
	of a recipe's name, and find the recipe along
	with all its information
	
	Scenario: find a recipe
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I search with "Test Recipe"
		And I click Search
		Then I should see the search results list
		And I should see "Test Recipe"
	

