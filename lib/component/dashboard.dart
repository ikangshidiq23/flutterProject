import 'dart:html';

import 'package:flutter/material.dart';
import '../models/cart.dart';

class Dashboard extends StatelessWidget {
  final List<Cart> _listCart; //mendefinisikan bariable untuk menampung data list cart

  Dashboard(this._listCart); //buat CONSTRUCTOR untuk meminta data list cartnya

  //buat GETTER untuk mendapatkan total item
  int get totalItem {
    //dimana datanya di dapatkan dr hasil sum qty
    return _listCart.fold(0, (sum, item) {
      return sum += item.qty;
    });
  }

  //buat GETTER untuk mendapatkan total PRICE
  double get totalPrice {
    //DATANYA KITA DAPAT DARI SUM HARGA
    return _listCart.fold(0, (sum, item){
      return sum += item.harga;
    });
  }

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 6, //tingkat ketebala shadow dr card
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //agar kedua elemen didalamnya di set sehingga memiliki jarak antar keduanya dan memenuhi card
          children: <Widget>[
            Column(children: <Widget>[
              //menampilkan total item
              Text("Total Item", style: Theme.of(context).textTheme.title,),
              SizedBox(height: 4),
              Text(totalItem.toString()+ " pcs", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ]),

          Column(children: <Widget>[
            //menampilkan total belanja
            Text("Total Belanja", style: Theme.of(context).textTheme.title,),
            SizedBox(height: 4),
            Text(totalPrice.toStringAsFixed(0), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ],)
          ]
          ,),),
    );
  }
}