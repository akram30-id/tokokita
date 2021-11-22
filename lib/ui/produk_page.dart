import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Produk'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(
                Icons.add,
                size: 26.0,
              ),
              onTap: () async {
                Navigator.push(
                    context,
                    PageTransition(
                        child: ProdukForm(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [ItemProduk()],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key key, this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: ProdukDetail(
                    produk: produk,
                  ),
                  type: PageTransitionType.rightToLeft));
        },
        child: Card(
          child: ListTile(
            title: Text(produk.namaProduk),
            subtitle: Text(produk.hargaProduk.toString()),
          ),
        ),
      ),
    );
  }
}
