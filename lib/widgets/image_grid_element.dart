import 'package:flutter/material.dart';

class ImageElementGrid extends StatelessWidget {
  final String image;

  ImageElementGrid({this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('utils/assets/images/$image'),
      ),
    );
  }
}