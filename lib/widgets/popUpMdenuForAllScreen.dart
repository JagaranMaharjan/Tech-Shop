import 'package:card/screens/cartScreen.dart';
import 'package:card/screens/categoryOverviewScreen.dart';
import 'package:card/screens/orderScreen.dart';
import 'package:card/screens/productOverviewScreen.dart';
import 'package:flutter/material.dart';

class PopUpMenuForAllScreen extends StatefulWidget {
  @override
  _PopUpMenuForAllScreenState createState() => _PopUpMenuForAllScreenState();
}

class _PopUpMenuForAllScreenState extends State<PopUpMenuForAllScreen> {
  PopUpMenuModel _selectedScreen = _screenList[0];

  void _selectScreen(PopUpMenuModel popUpMenuModel) {
    setState(() {
      _selectedScreen = popUpMenuModel;
      if (_selectedScreen.screenTitle == "Home") {
        // Navigator.of(context).pop();
        Navigator.of(context)
            .pushReplacementNamed(ProductOverviewScreen.routeName);
      }
      if (_selectedScreen.screenTitle == "Cart Screen") {
        //Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
      }
      if (_selectedScreen.screenTitle == "Order Screen") {
        //Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
      }
      if (_selectedScreen.screenTitle == "Category Screen") {
        // Navigator.of(context).pop();
        Navigator.of(context)
            .pushReplacementNamed(CategoryOverviewScreen.routeName);
      }
      if (_selectedScreen.screenTitle == "Manage Product") {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white.withOpacity(0.8),
      elevation: 3.2,
      icon: Card(
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 5,
        color: Colors.white,
        child: Icon(
          Icons.more_vert,
          size: 25,
          color: Colors.blue[900].withOpacity(1),
        ),
      ),
      onSelected: _selectScreen,
      itemBuilder: (context) {
        return _screenList.map((PopUpMenuModel popUpMenuModel) {
          return PopupMenuItem<PopUpMenuModel>(
            value: popUpMenuModel,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  popUpMenuModel.screenTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  child: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    color: Colors.red,
                    width: double.infinity,
                    height: 0.5,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}

class PopUpMenuModel {
  final String screenTitle;
  PopUpMenuModel({this.screenTitle});
}

List<PopUpMenuModel> _screenList = <PopUpMenuModel>[
  PopUpMenuModel(screenTitle: "Home"),
  PopUpMenuModel(screenTitle: "Cart Screen"),
  PopUpMenuModel(screenTitle: "Order Screen"),
  PopUpMenuModel(screenTitle: "Category Screen"),
  PopUpMenuModel(screenTitle: "Manage Product"),
];
