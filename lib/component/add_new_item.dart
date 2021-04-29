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
  }
}