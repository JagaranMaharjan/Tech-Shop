import 'package:card/provider/productsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersDropDownMenu extends StatefulWidget {
  @override
  _FiltersDropDownMenuState createState() => _FiltersDropDownMenuState();
}

class _FiltersDropDownMenuState extends State<FiltersDropDownMenu> {
  bool refreshIndicator = false;
  String hintText = "Select Price (Rs.)";
  List _priceList = [
    "Select Price (Rs.)",
    "0 - 500",
    "500 - 1000",
    "1000 - 5000",
    "5000 - 10000",
    "10000 - 50000",
    "50000 - 100000",
    "100000 +"
  ];

  String _priceValue;
  @override
  Widget build(BuildContext context) {
    final _filterLoadedProducts =
        Provider.of<ProductProvider>(context, listen: true);
    return Row(
      children: <Widget>[
        DropdownButton(
          hint: Text(
            hintText,
            style: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          elevation: 3,
          value: _priceValue,
          //disabledHint: Text(_priceValue),
          items: _priceList.map(
            (_priceList) {
              return DropdownMenuItem(
                child: Text(_priceList),
                value: _priceList,
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(
              () {
                _priceValue = value;
                if (_priceValue == "0 - 500") {
                  _filterLoadedProducts.filterProductsListByPrice(0, 500);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "500 - 1000") {
                  _filterLoadedProducts.filterProductsListByPrice(500, 1000);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "1000 - 5000") {
                  _filterLoadedProducts.filterProductsListByPrice(1000, 5000);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "5000 - 10000") {
                  _filterLoadedProducts.filterProductsListByPrice(5000, 10000);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "10000 - 50000") {
                  _filterLoadedProducts.filterProductsListByPrice(10000, 50000);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "50000 - 100000") {
                  _filterLoadedProducts.filterProductsListByPrice(
                      50000, 100000);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "100000 +") {
                  _filterLoadedProducts.filterProductsListByHighPrice(100000);
                  if (refreshIndicator == false) {
                    refreshIndicator = !refreshIndicator;
                  }
                }
                if (_priceValue == "Select Price (Rs.)") {
                  _priceValue = hintText;
                  _filterLoadedProducts.clearFilterList();
                  refreshIndicator = false;
                }
              },
            );
          },
        ),
        if (refreshIndicator)
          Row(
            children: <Widget>[
              SizedBox(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 0.3,
                  color: Colors.black,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.refresh,
                  size: 25,
                  color: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    refreshIndicator = !refreshIndicator;
                    _priceValue = hintText;
                    _filterLoadedProducts.clearFilterList();
                  });
                },
              ),
            ],
          ),
      ],
    );
  }
}
