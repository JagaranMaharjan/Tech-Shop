import 'package:flutter/material.dart';

class ClipperDemo extends StatefulWidget {
  @override
  _ClipperDemoState createState() => _ClipperDemoState();
}

class _ClipperDemoState extends State<ClipperDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 500,
              child: Image.network(
                "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2018/02/propose-1517999844.jpg",
                width: double.infinity,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
