import 'package:flutter/material.dart';

import '../listTileWithTrailing.dart';
import '../productExpandMoreContainer.dart';

class Delivery extends StatefulWidget {
  final String deliveryTimeText;
  Delivery({this.deliveryTimeText});
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  bool _delivery = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTileWithTrailing(
          leadingIcon: Icon(
            Icons.directions_bike,
            color: Colors.blueGrey,
            size: 25,
          ),
          title: "Delivery",
          trainingIconBtn: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              _delivery ? Icons.expand_less : Icons.expand_more,
              color: Colors.blueGrey,
              size: 25,
            ),
            onPressed: () {
              setState(
                () {
                  _delivery = !_delivery;
                },
              );
            },
          ),
        ),
        if (_delivery)
          ProductExpandMoreContainer(
            containerHeight: 50,
            child: Container(
              child: Text(
                widget.deliveryTimeText,
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 1,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              margin: EdgeInsets.only(left: 10),
            ),
          ),
      ],
    );
  }
}
