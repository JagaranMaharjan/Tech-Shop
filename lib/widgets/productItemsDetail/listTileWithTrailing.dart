import 'package:flutter/material.dart';

class ListTileWithTrailing extends StatefulWidget {
  final String title;
  final Icon leadingIcon;
  final IconButton trainingIconBtn;
  ListTileWithTrailing({this.title, this.leadingIcon, this.trainingIconBtn});

  @override
  _ListTileWithTrailingState createState() => _ListTileWithTrailingState();
}

class _ListTileWithTrailingState extends State<ListTileWithTrailing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 0),
      padding: EdgeInsets.all(0),
      width: double.infinity,
      //color: Colors.red,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: widget.leadingIcon,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
          ),
        ),
        trailing: widget.trainingIconBtn,
      ),
    );
  }
}
