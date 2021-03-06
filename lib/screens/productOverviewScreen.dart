import 'package:card/screens/addNewProduct.dart';
import 'package:card/screens/cartScreen.dart';
import 'package:card/screens/categoryOverviewScreen.dart';
import 'package:card/screens/orderScreen.dart';
import 'package:card/screens/voiceDemo.dart';
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
      drawer: Drawer(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Online Shop",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.1),
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(CategoryOverviewScreen.routeName);
                },
                leading: Icon(
                  Icons.category,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  "Category Screen",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.1),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                leading: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  "Cart Screen",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.1),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(OrderScreen.routeName);
                },
                leading: Icon(
                  Icons.shopping_basket,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  "Order Screen",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.1),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AddNewProduct.routeName);
                },
                leading: Icon(
                  Icons.shopping_basket,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                title: Text(
                  "Manage Product",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
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
          //VoiceDemo
          IconButton(
            icon: Icon(
              Icons.mic,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return VoiceDemo();
                },
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
