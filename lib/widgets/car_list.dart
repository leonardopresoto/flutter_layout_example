import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../models/car_item.dart';
import '../models/furniture.dart';


class CarList extends StatefulWidget {
  final Function update;

  CarList({this.update});

  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  final List<CarItem> car = Begin.carItems;
  final realFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: car.length,
      itemBuilder: (BuildContext context, int index) {
        CarItem item = car[index];
        Furniture furniture = item.furniture;

        return Container(
          margin: EdgeInsets.all(16),
          child: Card(
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    image:
                    AssetImage('utils/assets/images/${furniture.photo}'),
                    height: 92,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 92,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(furniture.title,
                            style: Theme.of(context).textTheme.headline3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(realFormat.format(furniture.price)),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => _addAmount(item),
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.add, size: 14),
                                  ),
                                ),
                                Text('${item.amount}'),
                                GestureDetector(
                                  onTap: () => _subAmount(item),
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.remove, size: 14),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _addAmount(CarItem item) {
    setState(() {
      item.amount++;
      widget.update();
    });
  }

  void _subAmount(CarItem item) {
    if (item.amount > 1) {
      setState(() {
        item.amount--;
        widget.update();
      });
    } else {
      _removeFurniture(item);
    }
  }

  void _removeFurniture(CarItem item) {
    setState(() {
      Begin.carItems.remove(item);
      widget.update();
    });
  }
}