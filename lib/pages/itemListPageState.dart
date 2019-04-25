import 'package:flutter/material.dart';
import 'package:recipes/model/item.dart';

class ItemListPageState extends State {
  Function retrieveItems;
  String title;
  String labelAdd;
  Function onItemTap;

  ItemListPageState({
    this.retrieveItems,
    this.title,
    this.labelAdd,
    @required this.onItemTap});

    
  List<Item> get items => retrieveItems(context) ?? new List<Item>();

  List<Widget> generateTiles() {
    List<Widget> tiles = new List(items.length);
    var currentItems = this.items;
    for(int i = 0; i < currentItems.length; i++) {
      tiles[i] = Stack(
        children: [
          Positioned.fill(
            child: Ink.image(
              image: AssetImage(items[i].placeholder),
              fit: BoxFit.cover,
              child: Container()
            )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(75, 0, 0, 0),
              ),
              padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
              child: Text(items[i].name,
                style: TextStyle(fontSize: 18, color: Colors.white),
                overflow: TextOverflow.ellipsis
              ),
            )
          ),
        ]
      );
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
      body: GridView.count(
        crossAxisCount: 2,
        children: generateTiles(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: labelAdd,
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }
}