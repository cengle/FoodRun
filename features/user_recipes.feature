Feature: View recipes that a user uploaded
	In order to see all the recipes I uploaded
	As a user
	I want to be able to see all the recipes I uploaded on one page
	
	Scenario: See recipes I uploaded
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I follow "my uploaded recipes"
		Then I should see "Test Recipe"
		