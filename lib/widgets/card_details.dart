import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../models/car_item.dart';
import '../models/furniture.dart';
import 'text_card_detail.dart';


class CardDetail extends StatelessWidget {
  final realFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  final Furniture furniture;
  final Function updatePage;

  CardDetail({this.furniture, this.updatePage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextCardDetails(
              text: furniture.title,
              style: Theme.of(context).textTheme.headline1),
          TextCardDetails(text: furniture.description),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  realFormat.format(furniture.price),
                  style: Theme.of(context).textTheme.headline1,
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _verifyItemList(
                      Begin.carItems,
                      CarItem(furniture: furniture, amount: 1),
                    );
                  },
                  child: Text('Buy', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addCarItem(CarItem item) {
    Begin.carItems.add(item);
    updatePage();
  }

  void _verifyItemList(
      List<CarItem> list, CarItem item) {
    int indexFurniture = list.indexWhere((item) => item.furniture == furniture);

    if (indexFurniture >= 0) {
      list[indexFurniture].amount = list[indexFurniture].amount + 1;
    } else {
      _addCarItem(item);
    }
  }
}