library data_provider;

import 'package:recipes/model/dish.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/model/requirement.dart';
import 'package:uuid/uuid.dart';

final DataProvider dataProvider = new DataProvider();

class DataProvider {
  Map<String, Dish> dishes;
  Map<String, Recipe> recipes;
  
  DataProvider() {
    Dish mainDish = new Dish(name: 'Main Course');

    dishes = {
      new Uuid().v4(): new Dish(name: 'Appetizer'),
      new Uuid().v4(): mainDish,
      new Uuid().v4(): new Dish(name: 'Dessert'),
      new Uuid().v4(): new Dish(name: 'Lunch'),
      new Uuid().v4(): new Dish(name: 'Breakfast'),
      new Uuid().v4(): new Dish(name: 'Snack'),
    };

    recipes = {
      new Uuid().v4(): new Recipe(
        name: 'Fish tacos with salsa picada',
        placeholder: 'assets/images/Main Course.jpg',
        time: 55,
        difficulty: 1,
        servings: 4,
        requirements: [
          new Requirement(name: 'maseca harina corn flour', amount: '150g'),
          new Requirement(name: 'flour + 4 tbsp', amount: '200g'),
          new Requirement(name: 'Mexican Beer', amount: '200ml'),
          new Requirement(name: 'Egg', amount: '1'),
          new Requirement(name: 'Salt'),
          new Requirement(name: 'ground chipotle', amount: '1tbsp'),
          new Requirement(name: 'garlic powder', amount: '1tbsp'),
          new Requirement(name: 'cod tails with skin', amount: '500g'),
          new Requirement(name: 'tomatoes', amount: '2-3'),
          new Requirement(name: 'chili pepper', amount: '2-4 red'),
          new Requirement(name: 'red union', amount: '1'),
          new Requirement(name: 'coriander', amount: '6 twigs'),
          new Requirement(name: 'mint', amount: '3 twigs'),
          new Requirement(name: 'lemon', amount: '1'),
          new Requirement(name: 'sugar'),
          new Requirement(name: 'tortilla press'),
          new Requirement(name: 'frying pan with oil'),
        ],
        instructions: '''1. Mix the maseca harina with a splash of water. Knead briefly into a smooth dough. If it is too dry, update a little extra water. Divide the dough into 4 balls and cover with plastic wrap or a damp tea towel. Set a minute or 10 apart.
2. For the salsa, cut the tomatoes into cubes. Cut the peppers into rings. Peel and chop the onion. Finely chop the coriander (including the stems) and mint leaves. Grate the zest of the lime. Mix the tomatoes, peppers, onion, coriander, mint and lime zest. Season with salt, lime juice and a little sugar.
3. Cover the tortilla press with two layers of strong plastic wrap. Flatten a ball of dough and carefully peel it from the plastic.
4. Heat the frying pan (without fat) and fry the soft tacos on both sides for about 3 minutes. Store in a tea towel. Press and bake the remaining tortillas.
5. For the fish fritters, beat a batter of 200 grams of flour, the beer and the egg. Season with salt, chipotle and garlic powder.
6. Cut the fish into thick strips, sprinkle with salt. Put the 4 tablespoons of flour in a bowl. First get the fish through the flour and then through the beer batter. Then slowly lower them into the frying fat in portions. Don't bake too many at the same time because they will stick together. Fry them in 3-4 minutes until golden brown. Drain on kitchen paper and sprinkle with some salt.
7. Serve the soft tacos with the fish fritters and salsa picada on top. Drizzle some lime juice over it if desired.'''
      )
    };

    mainDish.recipies = [recipes.values.first, recipes.values.first];
  }
}