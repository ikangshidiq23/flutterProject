import 'dart:html';

import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  final Function addNew; //kita mendefinisikan sebuang fungsi dengan nama addNew
  AddNewItem(this.addNew); //dimana fungsi ni di passing dari main.dart sehingga kita membuat constructor untuk meminta fungsinya

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem>{
  //buat controller untuk meng-handle texfield input
  final titleController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController = TextEditingController();

  //Method ini akan berjalan ketika tombol dari widget flatbutton ditekan
  void saveNewItem() {
    //mengambil value dari masing2 controller inputan dan menyimpan kedalam variable baru
    final title = titleController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    //CEK JIKA TIDAK SESUAI RULE DARI KONDISI IF NYA
    if(title.isEmpty || harga.isEmpty || qty <= 0){
      return; // maka stop tidak melakukan apa2
    }
    //jika sesuai maka fungsi addNew dijalankan dengan mengirimkan beberapa parameter untuk ditambahkan ke Cart pada main.dart
    widget.addNew(title, double.parse(harga), qty);
    //KARENA NANTINYA AKAN MENGGUNAKAN MODAL, MAKA GUNAKAN NAVIGATOR POP UNTUK MENUTUP MODAL
    Navigator.of(context).pop();
  }

  @Override
  Widget build(BuildContext context){
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nama Barang'),
              controller: titleController, //controller ini serupa dengan name pada inputan HTML
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga'),
              controller: hargaController,
              keyboardType: TextInputType.number, //keyboar hanya akan menampilkan angka
            ),
            TextField(
              decoration: InputDecoration(labelText: 'qty'),
              controller: qtyController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text('Tambah'),
              onPressed: saveNewItem, //KETIKA DI TEKAN JALANKAN METODE saveNEWitem
              textColor: Colors.pink,
            )
          ]
        ),
      ),)
  }
}