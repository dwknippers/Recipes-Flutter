import 'package:flutter/material.dart';
import 'package:recipes/pages/dishesPage.dart';
import 'package:recipes/pages/recipesPage.dart';

void main() => runApp(RecipesApp());

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => DishesPage(),
        '/recipes': (context) => RecipesPage(),
      },
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
