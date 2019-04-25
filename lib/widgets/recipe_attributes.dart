import 'package:flutter/material.dart';
import 'package:recipes/widgets/labeled_icon.dart';

class RecipeAttributeValues {
  int time, servings, difficulty;

  RecipeAttributeValues({this.time, this.servings, this.difficulty});
}

class RecipeAttributes extends StatefulWidget {
  final RecipeAttributeValues values;
  RecipeAttributes({this.values});

  @override
  State<StatefulWidget> createState() =>
    	RecipeAttributesState(values);
}

class RecipeAttributesState extends State<RecipeAttributes> {
  RecipeAttributeValues values;

  RecipeAttributesState(this.values);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LabeledIcon(icon: Icons.av_timer, label: values.time.toString()),
        LabeledIcon(icon: Icons.person_outline, label: values.servings.toString()),
        LabeledIcon(icon: Icons.av_timer, label: values.difficulty.toString()),
      ]
    );
  }
}