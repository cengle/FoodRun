


Given /^I have entered a recipe review with rating (\d+)$/ do |arg1|
	visit path_to('the home page')
	click_link('Chicken Burrito')
	click_link('Add Review')
        fill_in(:title, :with => 'Best recipe')
        fill_in(:review, :with => 'Best recipe evar')
  	fill_in(:rating, :with => arg1)
        click_button('Create')
end



