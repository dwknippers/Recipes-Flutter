import 'package:meta/meta.dart';
import 'package:recipes/model/item.dart';
import 'package:recipes/model/recipe.dart';

class Dish extends Item {
  List<Recipe> recipies;

  Dish({
    @required String name,
    String placeholder,
    this.recipies}) : super(name: name, placeholder: placeholder);
}