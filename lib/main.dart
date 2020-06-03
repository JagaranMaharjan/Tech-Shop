import 'package:card/screens/singleProductItemScreen.dart';
import 'package:flutter/material.dart';

import 'screens/productOverviewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Card Design",
      home: ProductOverviewScreen(),
      routes: {
        SingleProductItemScreen.routeName: (ctx) => SingleProductItemScreen(),
      },
    );
  }
}
