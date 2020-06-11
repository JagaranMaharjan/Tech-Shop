import 'package:card/widgets/newProduct/addPhoto.dart';
import 'package:card/widgets/newProduct/addPolicy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  static const String routeName = "addNewProduct";
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  FocusNode __productId;
  FocusNode __productTitle;
  FocusNode _productImgUrl;
  FocusNode _productModelNo;
  FocusNode _brandName;
  FocusNode _productCategory;
  FocusNode _productType;
  FocusNode _delivery;
  FocusNode _quantity;
  FocusNode _price;
  FocusNode _refundPolicy;
  FocusNode _returnPolicy;

  List<String> _returnPolicyList = [];
  List<String> _refundPolicyList = [];

  @override
  void dispose() {
    super.dispose();
    __productId.dispose();
    __productTitle.dispose();
    _productModelNo.dispose();
    _brandName.dispose();
    _productCategory.dispose();
    _productType.dispose();
    _delivery.dispose();
    _quantity.dispose();
    _price.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[900].withOpacity(0.1),
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              AddPhoto(),
              TextFormField(
                autofocus: false,
                focusNode: __productId,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(__productTitle);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Product ID",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: __productTitle,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productModelNo);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Product Title",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _productModelNo,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_brandName);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Model No",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _brandName,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productCategory);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Brand Name",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _productCategory,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productType);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Category",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _productType,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_delivery);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Product Type",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _delivery,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_quantity);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Delivery",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _quantity,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_price);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Quantity",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                autofocus: false,
                focusNode: _price,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Price",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              AddNewPolicy(
                refundPolicyList: _refundPolicyList,
                returnPolicyList: _returnPolicyList,
              ),
              FlatButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(color: Colors.grey),
                    ],
                  ),
                  child: Text(
                    "Add New Product",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
