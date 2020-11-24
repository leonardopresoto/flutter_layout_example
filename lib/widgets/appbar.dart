import 'package:flutter/material.dart';

import 'car_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isCarPage;

  CustomAppBar({this.title, this.isCarPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.black)),
      titleSpacing: 0.0,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        _updateCarPage(isCarPage),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget _updateCarPage(bool isCarPage) {
    if (isCarPage) return Container();
    return ButtonCar();
  }
}