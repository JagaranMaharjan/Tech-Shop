import 'package:flutter/material.dart';

import '../listTileWithTrailing.dart';
import '../productExpandMoreContainer.dart';
import '../productSpecificationItems.dart';

class Specification extends StatefulWidget {
  final String title1;
  final String value1;
  final String title2;
  final String value2;
  final String title3;
  final String value3;
  Specification(
      {this.title1,
      this.value1,
      this.title2,
      this.value2,
      this.title3,
      this.value3});
  @override
  _SpecificationState createState() => _SpecificationState();
}

class _SpecificationState extends State<Specification> {
  bool _specification = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTileWithTrailing(
          leadingIcon: Icon(
            Icons.description,
            color: Colors.blueGrey,
            size: 25,
          ),
          title: "Specification",
          trainingIconBtn: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              _specification ? Icons.expand_less : Icons.expand_more,
              color: Colors.blueGrey,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                _specification = !_specification;
              });
            },
          ),
        ),
        if (_specification)
          ProductExpandMoreContainer(
            containerHeight: 145,
            child: Column(
              children: <Widget>[
                ProductSpecificationItems(
                  title: widget.title1,
                  value: widget.value1,
                ),
                ProductSpecificationItems(
                  title: widget.title2,
                  value: widget.value2,
                ),
                ProductSpecificationItems(
                  title: widget.title3,
                  value: widget.value3,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
