=begin
When /^I fill in 'Search for recipe' field with chicken burrito$/ do
	fill_in('input', :with => 'chicken burrito')
end

When /^I fill in 'Search for recipe' field with chicken$/ do
  	fill_in('input', :with => 'chicken')
end

When /^I fill in 'Search for recipe' field with cKen$/ do
	fill_in('input', :with => 'cKen')
end
=end

When /^I fill in 'Search for recipe' field with "([^"]*)"$/ do |arg1|
	fill_in('input', :with => arg1)
end

