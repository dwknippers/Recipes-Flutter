import 'package:flutter/material.dart';
import 'package:recipes/model/item.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/widgets/recipe_attributes.dart';

enum ItemListPageStateStyle { Dish, Recipe }

class ItemListPageState extends State {
  Function retrieveItems;
  String title;
  String labelAdd;
  Function onItemTap;
  ItemListPageStateStyle style;

  ItemListPageState(
      {this.retrieveItems,
      this.title,
      this.labelAdd,
      this.style = ItemListPageStateStyle.Dish,
      @required this.onItemTap});

  List<Item> _cachedItems;
  List<Item> get items {
    if (_cachedItems != null) return _cachedItems;
    _cachedItems = retrieveItems(context) ?? new List<Item>();
    return _cachedItems;
  }

  dynamic generateBody() {
    switch (style) {
      case ItemListPageStateStyle.Dish:
        return GridView.count(crossAxisCount: 2, children: generateTiles());
      case ItemListPageStateStyle.Recipe:
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return generateTile(items[i]);
          },
        );
    }
  }

  Widget generateTile(Item item) {
    switch (style) {
      case ItemListPageStateStyle.Dish:
        return Card(
            margin: EdgeInsets.all(10),
            elevation: 6,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.primary.withAlpha(75),
              highlightColor: Theme.of(context).colorScheme.primary.withAlpha(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Ink.image(
                      image: AssetImage(item.placeholder),
                      fit: BoxFit.cover,
                      child: Container()
                    )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 8, 8, 10),
                    child: Text(
                      item.name,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    )
                  ),
                ]
              ),
          onTap: () {
            onItemTap(context, item);
          },
        ),
      );
      case ItemListPageStateStyle.Recipe:
        Recipe recipe = (item as Recipe);
        return Card(
            elevation: 6,
            margin: EdgeInsets.all(16),
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.primary.withAlpha(75),
              highlightColor:
                  Theme.of(context).colorScheme.primary.withAlpha(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ink.image(
                      image: AssetImage(item.placeholder),
                      fit: BoxFit.cover,
                      height: 200,
                      child: Container()),
                  Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: TextStyle(fontSize: 18)),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 16),
                            child: RecipeAttributes(
                              values: RecipeAttributeValues(
                                time: recipe.time,
                                servings: recipe.servings,
                                difficulty: recipe.difficulty,
                              ),
                            ),
                          ),
                          Text(
                            recipe.instructions,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.fade,
                            maxLines: 6,
                          ),
                        ],
                      ))
                ],
              ),
              onTap: () {
                onItemTap(context, item);
              },
            ));
    }
  }

  List<Widget> generateTiles() {
    List<Widget> tiles = new List(items.length);
    var currentItems = this.items;

    for (int i = 0; i < currentItems.length; i++) {
      tiles[i] = generateTile(items[i]);
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children:[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Image.asset('assets/images/cutlery.png'),
            ),
            Text(title),
          ]
        )
      ),
      body: generateBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: labelAdd,
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }
}
