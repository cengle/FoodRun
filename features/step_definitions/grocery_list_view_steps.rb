Given /^I have added two recipes that have (\d+) and (\d+) units of ingredient test$/ do |arg1, arg2|
	r1 = Recipe.new(:title => 'Test Recipe 1', 
		:description => 'This is a test recipe description')
	i1 = Ingredient.create(:name => 'test', :section => 'Miscellaneous')
	r1.ingredient_amounts.build(:unit => 'unit', :number => arg1, :ingredient_id => i1.id)
	r1.save
	
	r2 = Recipe.new(:title => 'Test Recipe 2', 
		:description => 'This is another test recipe description')
	r2.ingredient_amounts.build(:unit => 'unit', :number => arg2, :ingredient_id => i1.id)
	r2.save
end


