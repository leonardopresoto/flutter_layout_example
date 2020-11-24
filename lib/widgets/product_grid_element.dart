import 'package:flutter/material.dart';

import '../models/furniture.dart';
import '../screens/details.dart';
import 'color_grid_element.dart';
import 'image_grid_element.dart';
import 'title_grid_element.dart';


class ProductGridElement extends StatefulWidget {
  final Furniture furniture;
  final Function update;

  ProductGridElement({this.furniture, this.update});

  @override
  _ProductGridElementState createState() => _ProductGridElementState();
}

class _ProductGridElementState extends State<ProductGridElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(furniture: widget.furniture),
          ),
        ).then(
              (value) => widget.update(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ImageElementGrid(image: widget.furniture.photo),
              ColorGridElement(),
              TitleGridElement(title: widget.furniture.title)
            ],
          ),
        ),
      ),
    );
  }
}