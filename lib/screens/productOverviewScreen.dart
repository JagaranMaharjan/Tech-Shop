import 'package:card/widgets/productOverviewScreen/productOverviewScreenBody.dart';
import 'package:flutter/material.dart';

import 'file:///D:/Courses/shop_app/card/lib/widgets/productOverviewScreen/productOverviewScreenSearchBtn/searchProductsBar.dart';

class ProductOverviewScreen extends StatefulWidget {
  static const String routeName = "/productOverviewScreen";

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _lowToHigh = true;
  bool _highToLow = false;

  Choice _selectedChoice = choices[0];
  void _select(Choice choice) {
    setState(
      () {
        _selectedChoice = choice;
        if (_selectedChoice.title == "High To Low") {
          _lowToHigh = false;
          _highToLow = true;
        } else {
          _highToLow = false;
          _lowToHigh = true;
        }
        //print(_selectedChoice.title);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Screen"),
        actions: <Widget>[
          //added search action button
          //when an search button is pressed then it will open new context
          // where user can search their products
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchProductsBar(),
              );
            },
          ),

          //use of popup menu button widget to manage products according to
          // price in product overview screen
          PopupMenuButton(
            elevation: 3.2,
            icon: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              ),
            ),
            onSelected: _select,
            itemBuilder: (context) {
              return choices.map(
                (Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
      body: ProductOverviewScreenBody(
        highToLow: _highToLow,
        lowToHigh: _lowToHigh,
      ),
    );
  }
}

class Choice {
  final String title;
  Choice({this.title});
}

//created dummy list to display in popup menu button
List<Choice> choices = <Choice>[
  Choice(title: "High To Low"),
  Choice(title: "Low To High"),
];
