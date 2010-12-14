Feature: Dynamic sidebar of top recipes
	 In order for users to more easily view the highest rated recipes,
	 a dynamic sidebar should display the current top recipes based on
	 their reviews.

	 Scenario: High scoring recipe appears in sidebar
	       Given I have logged in
	       And I have added a recipe
		   And I am on the home page
		   And I follow "Test Recipe"
		   When I fill in review with this is a test review
		   And I select the rating 5 stars
		   And I press Save Review
		   When I go to the home page
		   Then I should see "Top Recipes"
		   And I should see "Test Recipe"
		   And I should see "Rating: 5.0"