import 'package:card/screens/filterScreen.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/productsProvider.dart';
import 'screens/productOverviewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProductProvider(),
      child: MaterialApp(
        title: "Card Design",
        home: ProductOverviewScreen(),
        routes: {
          SingleProductItemScreen.routeName: (ctx) => SingleProductItemScreen(),
          FilterScreen.routeName: (ctx) => FilterScreen(),
        },
      ),
    );
  }
}
