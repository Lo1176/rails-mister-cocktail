# frozen_string_literal: true

require 'open-uri'

# require 'json'
puts 'deleting ingredients ...'
Ingredient.delete_all

puts 'creating ingredients ...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts 'finished'
