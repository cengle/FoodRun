Feature: View recipes that a user uploaded
	In order to see all the recipes I uploaded
	As a user
	I want to be able to see all the recipes I uploaded on one page
	
	Scenario: See recipes I uploaded
		Given I have logged in
		And I have uploaded a recipe named "Pad thai"
		And I have uploaded a recipe named "Spaghetti"
		And I am on the home page
		When I follow "Uploaded recipes"
		Then I should see "Pad thai"
		Then I should see "Spaghetti"
		
		