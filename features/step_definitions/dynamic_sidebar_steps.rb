Given /^I have entered a recipe review with rating (\d+)$/ do |arg1|
	visit path_to('the home page')
	click_link('Test Recipe')
	click_link('Add Review')
        fill_in(:title, :with => 'Best recipe')
        fill_in(:review, :with => 'Best recipe evar')
  	fill_in(:rating, :with => arg1)
        click_button('Create')
end

When /^I select the rating 5 stars$/ do 
  choose 'review_rating_5'
end


