Feature: Review a recipe
	In order for users to let others know what 
	they thought of a recipe, users should be 
	able to add their own rating and review to 
	a given recipe
	
	Scenario: Go to review page
		Given I am on the recipe 1 page
		When I click Add Review
		Then I should be on the review recipe 1 page
	
	Scenario: Add a review
		Given I am on the review recipe 1 page
		When I fill in Title with Best recipe evar
		And I fill in Review with title says it all
		And I fill in rating with 5
		And click Create
		Then I should see Review successfully created
		And I should see Recipe: 1
		
