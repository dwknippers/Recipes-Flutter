import 'package:flutter/material.dart';
import 'package:recipes/pages/dishes_page.dart';
import 'package:recipes/pages/recipes_page.dart';

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
