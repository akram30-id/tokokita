import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  Produk produk;
  ProdukDetail({this.produk});

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Kode : ${widget.produk.kodeProduk}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Kode : ${widget.produk.namaProduk}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Kode : ${widget.produk.hargaProduk}',
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ignore: deprecated_member_use
        //tombol edit
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: ProdukForm(
                      produk: widget.produk,
                    ),
                    type: PageTransitionType.rightToLeft));
          },
          child: Text('EDIT'),
          color: Colors.green,
        )
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: Text('Yakin ingin menghapus data ini?'),
      actions: [
        //tombol hapus
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: () {},
          child: Text('Ya'),
          color: Colors.green,
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Batal'),
          color: Colors.red,
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
