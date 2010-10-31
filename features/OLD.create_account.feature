Feature: create account
	In order to enjoy the member benefits
	As a new user
	I want to be able to sign up for my own account
	
	Scenario: Go to create account page
		Given that I'm not logged in and am on FoodRun
		When I click "Join"
		Then I should be on a create membership page
		
	Scenario: Create account
		Given I am on the create membership page
		When I click "Create Account"
		Then my account should be created