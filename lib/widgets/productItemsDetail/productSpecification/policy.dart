import 'package:flutter/material.dart';

import '../listTileWithTrailing.dart';
import '../productExpandMoreContainer.dart';

class Policy extends StatefulWidget {
  final String title1;
  final String title2;
  final List<String> title1List;
  final List<String> title2List;
  Policy({this.title1, this.title2, this.title1List, this.title2List});
  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool _returnPolicy = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTileWithTrailing(
          leadingIcon: Icon(
            Icons.library_books,
            color: Colors.blueGrey,
            size: 25,
          ),
          title: "Policy",
          trainingIconBtn: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              _returnPolicy ? Icons.expand_less : Icons.expand_more,
              color: Colors.blueGrey,
              size: 25,
            ),
            onPressed: () {
              setState(
                () {
                  _returnPolicy = !_returnPolicy;
                },
              );
            },
          ),
        ),
        if (_returnPolicy)
          ProductExpandMoreContainer(
            containerHeight: 290,
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.title1,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.deepOrangeAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Products will be return only :",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 55,
                          minHeight: 50,
                          maxWidth: double.infinity,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.title1List.length,
                          itemBuilder: (context, index) {
                            return Text(
                              widget.title1List[index].toString(),
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1,
                                height: 1.5,
                                // fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title2,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.deepOrangeAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "You are able to return :",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 70,
                          minHeight: 70,
                          maxWidth: double.infinity,
                          minWidth: double.infinity,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.title2List.length,
                          itemBuilder: (context, index) {
                            return Text(
                              widget.title2List[index].toString(),
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1,
                                height: 1.5,
                                // fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              margin: EdgeInsets.only(left: 10),
            ),
          ),
      ],
    );
  }
}
