When /^I fill in 'Search for recipe' field with Chicken Burrito$/ do
	fill_in('input', :with => 'Chicken Burrito')
end

When /^I click Search$/ do
  	click_button('search-submit')
end

Then /^I should see the search results list$/ do
	if response.respond_to? :should
		response.should contain('Search results')
	else
		assert_contain 'Search results'
	end
end

Then /^I should see Chicken Burrito$/ do
	if response.respond_to? :should
		response.should contain('Chicken Burrito')
	else
		assert_contain 'Chicken Burrito'
	end
end

