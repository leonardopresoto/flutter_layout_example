import 'package:flutter/material.dart';
import '../main.dart';
import 'button_car_indicator.dart';

class ButtonCar extends StatefulWidget {
  @override
  _ButtonCarState createState() => _ButtonCarState();
}

class _ButtonCarState extends State<ButtonCar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/carrinho')
            .then((value) => setState(() {}));
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 30, left: 20),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            topLeft: Radius.circular(100),
          ),
        ),
        child: _carIndicatorVisibility(),
      ),
    );
  }

  Widget _carIndicatorVisibility() {
    if (Begin.carItems.length > 0) {
      return Stack(children: [
        Image(
            height: 30,
            image: AssetImage('utils/assets/icons/carrinho.png')),
        ButtonCarIndicator()
      ]);
    }
    return Image(
        height: 30, image: AssetImage('utils/assets/icons/carrinho.png'));
  }
}