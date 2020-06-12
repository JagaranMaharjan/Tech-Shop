import 'package:card/model/cartModel.dart';
import 'package:flutter/material.dart';

class OnTappedOrderItems extends StatelessWidget {
  final List<CartModel> cartModelList;
  OnTappedOrderItems({this.cartModelList});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.all(0),
      child: Container(
        //color: Colors.red,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: cartModelList.length == 1 ? 100 : 200,
        child: ListView.builder(
          itemCount: cartModelList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(),
                  color: Colors.white,
                  elevation: 1,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        /*Image.network(
                          cartModelList[index].prodImgUrl,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),*/
                        CircleAvatar(
                          backgroundImage:
                              FileImage(cartModelList[index].prodImgUrl),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 170,
                          //color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  cartModelList[index].prodTitle,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "PID : ${cartModelList[index].prodId}",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                    //fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "Qty. : ${cartModelList[index].quantity}",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                    //fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              top: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                              left: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Amount",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "${cartModelList[index].quantity * cartModelList[index].prodPrice}",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    letterSpacing: 1,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
