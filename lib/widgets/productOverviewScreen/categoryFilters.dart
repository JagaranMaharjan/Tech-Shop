import 'package:flutter/material.dart';

import 'categoryFiltersBtn.dart';
import 'filtersDropDown.dart';

class CategoryFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 25,
      color: Colors.blue[900].withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CategoryFiltersBtn(
            icons: Icons.category,
            title: "Category",
            onTap: () {},
          ),
          SizedBox(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 0.3,
              color: Colors.black,
            ),
          ),
          /*CategoryFiltersBtn(
            icons: Icons.attach_money,
            title: "Filters",
            onTap: () {
              FiltersDropDownMenu();
            },
          ),*/
          FiltersDropDownMenu(),
        ],
      ),
    );
  }
}
