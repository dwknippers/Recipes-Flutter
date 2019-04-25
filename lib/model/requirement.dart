import 'package:meta/meta.dart';
import 'package:recipes/model/item.dart';

class Requirement extends Item {
  String amount;

  Requirement({
    @required name,
    placeholder,
    this.amount}) : super(name: name, placeholder: placeholder);
}