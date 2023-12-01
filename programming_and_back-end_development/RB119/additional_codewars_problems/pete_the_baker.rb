=begin
Difficulty: medium

Pete likes to bake some cakes. He has some recipes and ingredients. 
Unfortunately, he is not good at maths. Can you help him to find out, 
how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the 
available ingredients (also an object) and returns the maximum number 
of cakes Pete can bake (integer). For simplicity, there are no units for 
the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). 
Ingredients that are not present in the objects, can be considered as 0.

Examples:

cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); # => returns 2

cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); # => returns 0

Input:
  - two hashes
Output:
  - an integer

Rules:
  - given two hashes
    - recipe
    - availible ingridients
  - return the number of meals we can make out of the amount of ingredients
    we have

Algorithm:
  - initialize the local variable meals to nil
  - iterate through the recipe hash
    - reference the value at the current key in the ingridients hash
    - if the referenced value is nil
      - return 0
    - otherwise
      - divide the referenced value by the current value
      - if the meals local variable is nil
        - reassign the meals the result of the division
      - else if the result of the division is less than the current value of
        the local variable meals
        - ressign the local variable meals to reference the result of the division
  - return meals
=end

def cakes(recipe, ingredients)
  meals = nil

  recipe.each do |ingredient, amount|
    availible_amount = ingredients[ingredient]

    return 0 if availible_amount.nil?
     
    current_ingredient_times = availible_amount / amount
    
    if meals.nil? || current_ingredient_times < meals
      meals = current_ingredient_times
    end
  end

  meals
end

  p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
  p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
  p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
  p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
  p cakes({"eggs"=>4, "flour"=>400},{}) == 0
  p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
