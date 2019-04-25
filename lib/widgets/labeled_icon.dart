import 'package:flutter/material.dart';

class LabeledIcon extends StatefulWidget {
  final IconData icon;
  final String label;

  LabeledIcon({this.icon, this.label});

  @override
  State<StatefulWidget> createState() =>
    	LabeledIconState(icon, label);
}

class LabeledIconState extends State<LabeledIcon> {
  IconData icon;
  String label;

  LabeledIconState(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        Text(label)
      ]
    );
  }
}