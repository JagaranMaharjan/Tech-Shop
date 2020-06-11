import 'package:card/widgets/newProduct/alertBox.dart';
import 'package:flutter/material.dart';

class AddNewPolicy extends StatelessWidget {
  final List<String> returnPolicyList;
  final List<String> refundPolicyList;
  AddNewPolicy({this.refundPolicyList, this.returnPolicyList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blueGrey,
            width: 0,
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          left: BorderSide(
            color: Colors.blueGrey,
            width: 0,
            style: BorderStyle.solid,
          ),
          right: BorderSide(
            color: Colors.blueGrey,
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Policy",
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
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
                    "Add Return Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertBox(
                        alertTitle: "Add Return Policy",
                        textFieldTitle: "Return Policy",
                        policyList: returnPolicyList,
                      );
                    },
                  );
                },
                padding: EdgeInsets.all(2),
              ),
              FlatButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 145,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(color: Colors.grey),
                    ],
                  ),
                  child: Text(
                    "Add Refund Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertBox(
                        alertTitle: "Add Refund Policy",
                        textFieldTitle: "Refund Policy",
                        policyList: refundPolicyList,
                      );
                    },
                  );
                },
                padding: EdgeInsets.all(2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
