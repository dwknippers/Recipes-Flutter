import 'package:meta/meta.dart';

abstract class Item {
  String name;
  String placeholder;

  Item({
    @required this.name,
    this.placeholder}) : assert(name != "") {
      if (placeholder?.isEmpty ?? true) this.placeholder = 'assets/images/' + name + '.jpg';
  }
}