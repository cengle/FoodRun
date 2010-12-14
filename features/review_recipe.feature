Feature: Review a recipe
	In order for users to let others know what 
	they thought of a recipe, users should be 
	able to add their own rating and review to 
	a given recipe
	
	Scenario: Review a recipe
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I follow "Test Recipe"
		And I fill in review with this is a test review
		And I select 4 stars
		And I press Save Review
		And I am on the home page
		Then I should see "Rating: 4.0"		
