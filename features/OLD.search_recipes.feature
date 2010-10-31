Feature: search for recipes
	In order to find recipes I'm interested in
	As a logged-in member
	I want to be able to search the database of recipes
	
	Scenario: find recipes
		Given that I put "pasta" in the search bar
		When I click "Search"
		Then I should see recipes related to pasta
		