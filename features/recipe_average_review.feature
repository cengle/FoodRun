Feature: See the average review 
	In order to see what people think of the recipe
	As a user
	I want to be able to see the average recipe rating

	Scenario: Add one review
		Given I have added a recipe
		And I am viewing the recipe named "Chicken Burrito"
		And I add a review with a rating of "5"
		When I follow "back"
		Then I should see "Average Review: 5.0"
		
	Scenario: Add multiple reviews
		Given I have added a recipe
		And I am viewing the recipe named "Chicken Burrito"
		And I add a review with a rating of "5"
		When I follow "back"
		And I add a review with a rating of "3"
		When I follow "back"
		And I add a review with a rating of "4"
		When I follow "back"
		Then I should see "Average Review: 4.0"