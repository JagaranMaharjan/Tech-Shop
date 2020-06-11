import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File _image;
  final _imagePicker = ImagePicker();
  Future getImage(ImageSource imageSource) async {
    final pickedImage = await _imagePicker.getImage(source: imageSource);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: _image == null
                    ? Text("Add Photo")
                    : Image.file(
                        _image,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            if (_image != null)
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _image = null;
                    });
                  },
                  padding: EdgeInsets.all(2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(5),
                    width: 150,
                    height: 30,
                    color: Colors.black54,
                    child: Text(
                      "Remove Photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, letterSpacing: 1),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton.icon(
              padding: EdgeInsets.all(0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                getImage(ImageSource.camera);
              },
              icon: Icon(Icons.camera),
              label: Text("Take Photo"),
            ),
            SizedBox(
              child: Container(
                width: 160,
                height: 0.5,
                color: Colors.blue,
              ),
            ),
            FlatButton.icon(
              padding: EdgeInsets.all(0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              icon: Icon(Icons.filter_b_and_w),
              label: Text("Upload From Gallery"),
            ),
          ],
        ),
      ],
    );
  }
}
