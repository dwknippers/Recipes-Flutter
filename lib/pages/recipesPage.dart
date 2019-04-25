import 'package:flutter/material.dart';
import 'package:recipes/model/data_provider.dart';
import 'package:recipes/pages/itemListPageState.dart';

class RecipesPage extends StatefulWidget {
  @override
  ItemListPageState createState() => ItemListPageState(
    retrieveItems: (context) => 
      dataProvider.dishes[ModalRoute.of(context).settings.arguments].recipies,
    title: 'Recipes',
    labelAdd: 'Add new recipe',
    onItemTap: () {}
  );
}