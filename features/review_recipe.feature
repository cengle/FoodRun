Feature: Review a recipe
	In order for users to let others know what 
	they thought of a recipe, users should be 
	able to add their own rating and review to 
	a given recipe
	
	Scenario: Go to review page
		Given I have added a recipe
		And I am on the home page
		When I click Show
		And I click Add Review
		Then I should see the new review form
		
	Scenario: Add a review
		Given I am entering a recipe review
		When I fill in Title with Best recipe evar
		And I fill in Review with title says it all
		And I fill in rating with 5
		And click Create
		Then I should see Review successfully created	
	

		
