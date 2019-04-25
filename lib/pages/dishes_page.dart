import 'package:flutter/material.dart';
import 'package:recipes/model/data_provider.dart';
import 'package:recipes/pages/item_list_page_state.dart';

class DishesPage extends StatefulWidget {
  @override
  ItemListPageState createState() => ItemListPageState(
    retrieveItems: (context) => dataProvider.dishes.values.toList(),
    title: 'Dishes',
    labelAdd: 'Add new dish',
    onItemTap: (context, item) {
      Navigator.pushNamed(
        context,
        '/recipes',
        arguments: dataProvider.dishes.keys.firstWhere((k) => 
          dataProvider.dishes[k] == item
        ));
    }
  );
}