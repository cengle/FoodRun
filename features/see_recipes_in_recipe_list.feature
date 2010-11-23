Feature: See recipes in recipe list
	In order to see all the recipes I added
	As a user
	I want to be able to see all the recipes I added to the list on one page

	Scenario: See recipe in recipe list
		Given I have logged in
		And I have added a recipe to the recipe list named "Chicken Burrito"
		And I have added a recipe to the recipe list named "Cookies"
		And I am on the home page
		When I follow "Recipe list"
		Then I should see "Chicken Burrito"
		And I should see "Cookies"