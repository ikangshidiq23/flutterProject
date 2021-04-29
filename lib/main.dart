import 'package:flutter/material.dart';
import './component/product_list.dart';
import './component/dashboard.dart';
import './models/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping Bag",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.purpleAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          home: Home(),
        );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart>_carts =[
    //sebagai permulaan kita tambahkan dua data dummy
    Cart(id: 'DW1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'DW1', title: 'Shampoo', harga: 17000, qty: 2),
  ];
  @override
  Widget buid(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: Text("Dafrar Belanjaan"),
    ),
    body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Dashboard(_carts), 
        ProductList(_carts),
      ],)
    ),
    );
  }
}