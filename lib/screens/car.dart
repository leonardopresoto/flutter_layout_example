import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../widgets/appbar.dart';
import '../widgets/car_list.dart';


class Car extends StatefulWidget {
  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  final realFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    int _totalSum = _calcTotal();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(
        title: 'Car',
        isCarPage: true,
      ),
      body: CarList(update: update),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: Theme.of(context).textTheme.headline4),
            Text(realFormat.format(_totalSum),
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }

  void update() {
    setState(() {});
  }

  int _calcTotal() {
    if (Begin.carItems.isNotEmpty) {
      return Begin.carItems
          .map((item) => item.furniture.price * item.amount)
          .reduce((currentPrice, newPrice) => currentPrice + newPrice);
    }

    return 0;
  }
}