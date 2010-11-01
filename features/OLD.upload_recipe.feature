Feature: Upload recipe
	In order to share recipes publicly
	As a logged-in member
	I want to able to post and upload my recipes to FoodRun
	
	Scenario: Find uploaded recipe
		Given that I am on the upload recipe page and have inputted valid data
		When I click "Submit Recipe"
		Then I should be able to find and search for it