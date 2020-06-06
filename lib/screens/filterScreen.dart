import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "filterScreens";
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Your Products"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[900].withOpacity(0.1),
        child: Column(
          children: <Widget>[
            Container(
              child: Text("According To Price"),
            ),
            Container(
              child: Text("According To Category"),
            ),
          ],
        ),
      ),
    );
  }
}
