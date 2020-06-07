import 'package:card/provider/categoryProvider.dart';
import 'package:card/provider/productsProvider.dart';
import 'package:card/widgets/categoryOverviewScreen/categoryListView.dart';
import 'package:card/widgets/productOverviewScreen/productOverviewScreenSearchBtn/searchProductsBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryOverviewScreen extends StatefulWidget {
  static const String routeName = "categoryOverviewScreen";

  @override
  _CategoryOverviewScreenState createState() => _CategoryOverviewScreenState();
}

class _CategoryOverviewScreenState extends State<CategoryOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final _loadedCategory = Provider.of<CategoryProvider>(context).categoryList;
    final _sendCategoryTitle = Provider.of<ProductProvider>(context);

    //String _getCategoryTitle = "";
    //print(_getCategoryTitle);
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Category"),
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
              setState(
                () {
                  showSearch(
                    context: context,
                    delegate: SearchProductsBar(),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[900].withOpacity(0.1),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      70,
                  width: MediaQuery.of(context).size.width / 5,
                  //color: Colors.blue,
                  child: ListView.builder(
                      itemCount: _loadedCategory.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                _sendCategoryTitle
                                    .categoryList(_loadedCategory[index].title);
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            width: 100,
                            height: 85,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(color: Colors.blue.withOpacity(0.5))
                              ],
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                                left: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                  _loadedCategory[index].imageUrl,
                                  width: double.infinity,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(
                                    _loadedCategory[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.8),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  width: 50,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.refresh,
                      size: 25,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _sendCategoryTitle.clearCategoryList();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Container(
                width: 0.5,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey,
              ),
            ),
            CategoryListView(),
          ],
        ),
      ),
    );
  }
}
