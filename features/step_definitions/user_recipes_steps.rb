Given /^I have added a recipe named (.+)$/ do |recipe_name|
	visit '/recipes/new'
	fill_in(:title, :with => recipe_name)
	click_button('Create')
	click_link('Back')
end
