import 'package:flutter/material.dart';

import 'color_palette.dart';
import 'models/car_item.dart';
import 'screens/car.dart';
import 'widgets/appbar.dart';
import 'widgets/grid_products.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/carrinho': (context) => Car(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Furniture Shop',
        theme: ThemeData(
          primarySwatch: ColorsPalette().lilas,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alata',
                color: Colors.black),
            headline2: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alata',
                color: Colors.white),
            headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alata',
                color: Colors.black),
            headline4: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            headline5: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                fontFamily: 'Alata',
                color: Colors.black),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Begin());
  }
}

class Begin extends StatefulWidget {
  static List<CarItem> carItems = List();
  @override
  _BeginState createState() => _BeginState();
}

class _BeginState extends State<Begin> {
  final List furniture = [
    {
      "title": "Table",
      "price": 300,
      "photo": "movel1.jpeg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Chair",
      "price": 120,
      "photo": "movel2.jpg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Blanket",
      "price": 200,
      "photo": "movel3.jpg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Grey Couch",
      "price": 800,
      "photo": "movel4.jpg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Night Table",
      "price": 400,
      "photo": "movel5.jpg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Jogo de Cama",
      "price": 250,
      "photo": "movel6.jpg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Sofá Branco",
      "price": 900,
      "photo": "movel7.jpg",
      "description":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:
      CustomAppBar(title: 'Furniture Shop', isCarPage: false),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin:
                  EdgeInsets.only(left: 30, right: 20, top: 10, bottom: 10),
                  child: Divider(),
                ),
              ),
              Text('Products'),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 30, top: 10, bottom: 10),
                      child: Divider()))
            ],
          ),
          Flexible(
            child: ProductGrid(
              update: update,
              furnitures: furniture,
            ),
          )
        ],
      ),
    );
  }

  void update() {
    setState(() {});
  }
}