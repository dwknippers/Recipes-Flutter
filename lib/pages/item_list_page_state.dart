import 'package:flutter/material.dart';
import 'package:recipes/model/item.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/widgets/recipe_attributes.dart';

enum ItemListPageStateStyle {
  Dish, Recipe
}

class ItemListPageState extends State {
  Function retrieveItems;
  String title;
  String labelAdd;
  Function onItemTap;
  ItemListPageStateStyle style;

  ItemListPageState({
    this.retrieveItems,
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
    switch(style) {
      case ItemListPageStateStyle.Dish:
        return GridView.count(
          crossAxisCount: 2,
          children: generateTiles()
        );
      case ItemListPageStateStyle.Recipe:
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            Recipe recipe = (items[i] as Recipe);
            return Card(
              elevation: 8,
              margin: EdgeInsets.all(16),
              child: InkWell(
                splashColor: Theme.of(context).colorScheme.primary.withAlpha(75),
                highlightColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ink.image(
                      image: AssetImage(items[i].placeholder),
                      fit: BoxFit.cover,
                      height: 200,
                      child: Container()
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[i].name, style: TextStyle(fontSize: 18)),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 16),
                            child: RecipeAttributes(
                              values: RecipeAttributeValues(
                                time: recipe.time,
                                servings: recipe.servings,
                                difficulty: recipe.difficulty,
                              ),
                            ),
                          ),
                          Text(recipe.instructions, style: TextStyle(fontSize: 14), overflow: TextOverflow.fade, maxLines: 6,),
                        ],
                      )
                    )
                  ],
                ),
                onTap: (){},
              )
            );
          },
        );
    }
  }

  Widget generateTile(Item item) {
    switch(style) {
      case ItemListPageStateStyle.Dish:
        return InkWell(
          splashColor: Theme.of(context).colorScheme.primary.withAlpha(75),
          highlightColor: Theme.of(context).colorScheme.primary.withAlpha(50),
          child: Stack(
          children: [
            Positioned.fill(
              child: Ink.image(
                image: AssetImage(item.placeholder),
                fit: BoxFit.cover,
                child: Container()
              )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Ink(
                decoration: BoxDecoration(
                  color: Color.fromARGB(75, 0, 0, 0),
                ),
                padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                child: Text(item.name,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  overflow: TextOverflow.ellipsis
                ),
              )
            )
          ]
        ),
        onTap: (){
          onItemTap(context, item);
        });
      case ItemListPageStateStyle.Recipe:
        return Container();
    }
  }

  List<Widget> generateTiles() {
    List<Widget> tiles = new List(items.length);
    var currentItems = this.items;

    for(int i = 0; i < currentItems.length; i++) {
      tiles[i] = generateTile(items[i]);
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
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