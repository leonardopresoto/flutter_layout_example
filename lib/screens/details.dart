import 'package:flutter/material.dart';

import '../models/furniture.dart';
import '../widgets/appbar.dart';
import '../widgets/card_details.dart';


class Details extends StatefulWidget {
  final Furniture furniture;

  Details({this.furniture});

  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
              AssetImage('utils/assets/images/${widget.furniture.photo}'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: '',
          isCarPage: false,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 205,
            margin: EdgeInsets.all(16),
            child: CardDetail(
              furniture: widget.furniture,
              updatePage: update,
            ),
          ),
        ),
      ),
    );
  }

  void update() {
    setState(() {});
  }
}