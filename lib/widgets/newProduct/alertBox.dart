import 'package:flutter/material.dart';

class AlertBox extends StatefulWidget {
  final String alertTitle;
  final String textFieldTitle;
  final List<String> policyList;
  AlertBox({this.alertTitle, this.textFieldTitle, this.policyList});
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  TextEditingController _newPolicy = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _newPolicy.dispose();
    super.dispose();
  }

  void addToList() {
    if (_newPolicy.text.toString().isNotEmpty) {
      setState(() {
        widget.policyList.add(_newPolicy.text.toString());
      });
      _newPolicy.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        widget.alertTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {},
        ),
        FlatButton(
          child: Text("OK"),
          onPressed: () {},
        ),
      ],
      content: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: widget.policyList.length == 0 ? 110 : 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            if (widget.policyList.length != 0)
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      style: BorderStyle.solid,
                      width: 0.5,
                      color: Colors.grey,
                    ),
                    top: BorderSide(
                      style: BorderStyle.solid,
                      width: 0.5,
                      color: Colors.grey,
                    ),
                    bottom: BorderSide(
                      style: BorderStyle.solid,
                      width: 0.5,
                      color: Colors.grey,
                    ),
                    left: BorderSide(
                      style: BorderStyle.solid,
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                /*child: ListView.builder(
                    itemCount: widget.policyList.length,
                    itemBuilder: (ctx, index) {
                      return Text(widget.policyList[index]);
                    }),*/
              ),
            TextFormField(
              controller: _newPolicy,
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: widget.textFieldTitle,
                labelStyle: TextStyle(fontSize: 16),
              ),
            ),
            FlatButton(
              child: Container(
                padding: EdgeInsets.all(10),
                width: 140,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(color: Colors.grey),
                  ],
                ),
                child: Text(
                  "Add New Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
              ),
              onPressed: () {
                addToList();
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.all(2),
            ),
          ],
        ),
      ),
    );
  }
}
