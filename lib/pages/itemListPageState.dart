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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 0),
          itemCount: items.length + 1,
          itemBuilder: (context, i) {
            if (i == items.length) {
              return Center(
                heightFactor: 3,
                child: Text('End of results'),
              );
            } else return _buildRow(items[i]);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: labelAdd,
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRow(Item item) {
    return ListTile(
      leading: Image.asset(item.placeholder, width: 100, height: 88, fit: BoxFit.cover),
      contentPadding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      title: Text(item.name),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        onItemTap(context, item);
      },
    );
  }
}