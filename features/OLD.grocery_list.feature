Feature: grocery lists
	In order to know a ingredient list of the recipes I want to make
	As a logged-in member
	I want to add recipes to my shopping cart and have the ingredients aggregated into one grocery list
	
	Scenario: Create grocery list at checkout
		Given that I added recipes to my shopping cart
		When I checkout
		Then I should see an option to put the recipes on a calendar
		And I should see a link to the grocery list
