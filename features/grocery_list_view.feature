Feature: View recipe list as a list of ingredients
	In order to know what ingredients to buy
	As a user
	I want to be able to see my list of recipes as a list of ingredients

	Scenario: See recipe in recipe list
		Given I have created a recipe list
		And I have added a cookie recipe to the recipe list named "Sugar Cookies"
		And I have added a cookie recipe to the recipe list named "Chocolate Chip Cookies"
		And I am on the home page
		When I follow "Recipe list"
		And I follow "Show Grocery List"
		Then I should see "cookie dough"
		And I should see "10 pounds"