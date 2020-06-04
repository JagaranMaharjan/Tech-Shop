import 'package:card/widgets/productOverviewScreenSearchBtn/searchResult.dart';
import 'package:flutter/material.dart';

class SearchProductsBar extends SearchDelegate {
  //theme data method has been override to change app bar color, to change
  // app bar input text, hint text color and font size
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.blue,
      textTheme: TextTheme(
        title: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.white,
        hintStyle: TextStyle(
            color: theme.primaryTextTheme.title.color,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  // when i have an search bar what kind of action i want to perform
  //simply, known as actions for app bar
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  //leading icon on the left of the app bar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  //show result based on the selection
  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(
      query: query,
    );
  }

  //show when someone searches for something
  @override
  Widget buildSuggestions(BuildContext context) {
    return query.trim().isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                size: 80,
                color: Colors.blue.withOpacity(0.80),
              ),
              SizedBox(
                height: 0,
              ),
              Center(
                child: Text(
                  "Search Your Product",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    color: Colors.blue.withOpacity(0.80),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        : SearchResult(
            query: query,
          );
  }
}
