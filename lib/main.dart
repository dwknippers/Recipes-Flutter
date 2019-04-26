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
        primaryColor: Colors.green.shade200,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.green.shade200,
        accentColorBrightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.green.shade200,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        buttonColor: Colors.green.shade200,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
