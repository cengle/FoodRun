Feature: Dynamic sidebar of top recipes
	 In order for users to more easily view the highest rated recipes,
	 a dynamic sidebar should display the current top recipes based on
	 their reviews.

	 Scenario: High scoring recipe appears in sidebar
	           Given I have added a recipe
		   And I have entered a recipe review with rating 10
		   And I have entered a recipe review with rating 8 
		   When I go to the home page
		   Then I should see "Top Recipes"
		   And I should see "Chicken Burrito"
		   And I should see "Rating: 9.0"