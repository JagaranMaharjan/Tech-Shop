import 'dart:io';

import 'package:card/model/productModel.dart';
import 'package:card/provider/productsProvider.dart';
import 'package:card/widgets/newProduct/addPhoto.dart';
import 'package:card/widgets/newProduct/addPolicy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatefulWidget {
  static const String routeName = "addNewProduct";
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  FocusNode __productId;
  FocusNode __productTitle;
  FocusNode _productModelNo;
  FocusNode _brandName;
  FocusNode _productCategory;
  FocusNode _productType;
  FocusNode _delivery;
  FocusNode _quantity;
  FocusNode _price;

  @override
  void dispose() {
    __productId.dispose();
    __productTitle.dispose();
    _productModelNo.dispose();
    _brandName.dispose();
    _productCategory.dispose();
    _productType.dispose();
    _delivery.dispose();
    _quantity.dispose();
    _price.dispose();
    super.dispose();
  }

  static List<String> _returnPolicyList = [];
  static List<String> _refundPolicyList = [];
  static String _image;

  void _setImage(File imageFile) {
    setState(() {
      _image = imageFile.toString();
      print("i had set image");
      print(_image);
    });
  }

  var _form = GlobalKey<FormState>();

  var _productDetails = ProductModel(
    productId: "",
    modelNo: "",
    productTitle: "",
    quantity: 0,
    price: 0,
    delivery: "",
    productType: "",
    productCategory: "",
    productImageUrl: File(_image),
    brandName: "",
    refundPolicy: _refundPolicyList,
    returnPolicy: _returnPolicyList,
  );

  void _saveForm() {
    _form.currentState.save();
    print("my image file name is :");
    print(_image);
    Provider.of<ProductProvider>(context, listen: false)
        .addNewProduct(productModel: _productDetails);
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
          key: _form,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              AddPhoto(
                image: _setImage,
              ),
              TextFormField(
                autofocus: false,
                focusNode: __productId,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(__productTitle);
                },
                onSaved: (value) {
                  print("product id is :");
                  print(value.toString());
                  _productDetails = ProductModel(
                    productId: value.toString(),
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productModelNo);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: value.toString(),
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_brandName);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: value.toString(),
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productCategory);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: value.toString(),
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productType);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: value.toString(),
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_delivery);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: value.toString(),
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_quantity);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: value.toString(),
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_price);
                },
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: int.parse(value.toString()),
                    delivery: _productDetails.delivery,
                    price: _productDetails.price,
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
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
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _productDetails = ProductModel(
                    productId: _productDetails.productId,
                    productTitle: _productDetails.productTitle,
                    modelNo: _productDetails.modelNo,
                    brandName: _productDetails.brandName,
                    productType: _productDetails.productType,
                    productCategory: _productDetails.productCategory,
                    productImageUrl: _productDetails.productImageUrl,
                    quantity: _productDetails.quantity,
                    delivery: _productDetails.delivery,
                    price: double.parse(value.toString()),
                    returnPolicy: _productDetails.returnPolicy,
                    refundPolicy: _productDetails.refundPolicy,
                  );
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Quantity",
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
                onPressed: () {
                  _saveForm();
                },
                padding: EdgeInsets.all(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
