import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  final String _image;
  PopularCard(this._image);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2.0,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: AssetImage(this._image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
