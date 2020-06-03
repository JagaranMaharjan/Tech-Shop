import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSpecificationItems extends StatelessWidget {
  final String title;
  final String value;
  ProductSpecificationItems({this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Icon(
            Icons.stop,
            size: 20,
            color: Colors.grey,
          ),
          padding: EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 0),
          margin: EdgeInsets.all(0),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
            margin: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    ":",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    value,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
