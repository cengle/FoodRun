Feature: Improve recipe search
	As a user
	I want to be able to easily find recipes with the search feature
	By searching for part of recipe names and ignoring case
	
	Scenario: Search for a recipe with different case
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I fill in 'Search for recipe' field with chicken burrito
		And I click Search
		Then I should see the search results list
		And I should see Chicken Burrito
	
	Scenario: Search for a recipe with part of a recipe name
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I fill in 'Search for recipe' field with chicken
		And I click Search
		Then I should see the search results list
		And I should see Chicken Burrito
		
	Scenario: Search for a recipe with part of a word from a recipe name
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I fill in 'Search for recipe' field with cKen
		And I click Search
		Then I should see the search results list
		And I should see Chicken Burrito
