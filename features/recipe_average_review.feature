Feature: See the average review 
	In order to see what people think of the recipe
	As a user
	I want to be able to see the average recipe rating

	Scenario: Add one review
		Given I have logged in
		And I have added a recipe2
		And I am on the home page
		When I follow "Test Recipe2"
		And I select 5 stars
		And I press "Save review"
		When I go to the home page
		And I follow "Test Recipe2"
		Then I should see "Average Review: 5.0"
		
	Scenario: Add multiple reviews
		Given I have logged in
		And I have added a recipe
		And I am on the home page
		When I follow "Test Recipe"
		And I select 5 stars
		And I press "Save review"
		And I go to the home page
		And I follow "Test Recipe"
		And I select 5 stars
		And I press "Save review"
		And I go to the home page
		And I follow "Test Recipe"
		And I select 5 stars
		And I press "Save review"
		And I go to the home page
		And I follow "Test Recipe"
		Then I should see "Average Review: 5.0"