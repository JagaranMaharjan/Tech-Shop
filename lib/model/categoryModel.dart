import 'package:flutter/cupertino.dart';

class CategoryModel with ChangeNotifier {
  final String cid;
  final String title;
  final String imageUrl;
  CategoryModel({this.cid, this.title, this.imageUrl});
}
