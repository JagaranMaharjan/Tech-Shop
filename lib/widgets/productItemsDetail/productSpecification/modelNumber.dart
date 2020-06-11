import 'package:flutter/material.dart';

import '../listTileWithTrailing.dart';

class ModelNumber extends StatefulWidget {
  final String modelNumber;
  final bool isFavorite;
  final Function favToggleFunction;
  ModelNumber({this.modelNumber, this.isFavorite, this.favToggleFunction});

  @override
  _ModelNumberState createState() => _ModelNumberState();
}

class _ModelNumberState extends State<ModelNumber> {
  @override
  Widget build(BuildContext context) {
    print("i am from model number class");
    print(widget.isFavorite);
    return ListTileWithTrailing(
      leadingIcon: Icon(
        Icons.short_text,
        color: Colors.blueGrey,
        size: 25,
      ),
      title: "Model No. : ${widget.modelNumber}",
      trainingIconBtn: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          widget.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 25,
        ),
        onPressed: () {
          setState(() {
            widget.favToggleFunction();
          });
        },
      ),
    );
  }
}
