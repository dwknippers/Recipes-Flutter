import 'package:meta/meta.dart';
import 'package:recipes/model/item.dart';
import 'package:recipes/model/requirement.dart';

class Recipe extends Item {
  List<Requirement> requirements;
  int time;
  int difficulty;
  String instructions;
  int servings;

  Recipe({
    @required name,
    placeholder,
    this.time,
    this.difficulty,
    this.requirements,
    this.instructions,
    int servings}) : super(name: name, placeholder: placeholder);
}