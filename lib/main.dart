import 'package:card/provider/categoryProvider.dart';
import 'package:card/screens/categoryOverviewScreen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Card Design",
        home: ProductOverviewScreen(),
        routes: {
          SingleProductItemScreen.routeName: (ctx) => SingleProductItemScreen(),
          CategoryOverviewScreen.routeName: (ctx) => CategoryOverviewScreen(),
        },
      ),
    );
  }
}
/*

   * */
