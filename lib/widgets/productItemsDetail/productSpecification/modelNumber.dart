import 'package:flutter/material.dart';

import '../listTileWithTrailing.dart';

class ModelNumber extends StatelessWidget {
  final String modelNumber;
  ModelNumber({this.modelNumber});
  @override
  Widget build(BuildContext context) {
    return ListTileWithTrailing(
      leadingIcon: Icon(
        Icons.short_text,
        color: Colors.blueGrey,
        size: 25,
      ),
      title: "Model No. : $modelNumber",
      trainingIconBtn: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          Icons.favorite_border,
          color: Colors.blueGrey,
          size: 25,
        ),
        onPressed: () {},
      ),
    );
  }
}
