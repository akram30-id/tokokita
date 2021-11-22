import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';

class ProdukForm extends StatefulWidget {
  Produk produk;
  ProdukForm({this.produk});

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk";
  String tombolSubmit = "Simpan";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUpdate();
  }

  void isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "Ubah Produk";
        tombolSubmit = "Ubah";
        _kodeProdukTextboxController.text = widget.produk.kodeProduk;
        _namaProdukTextboxController.text = widget.produk.namaProduk;
        _hargaProdukTextboxController.text =
            widget.produk.hargaProduk.toString();
      });
    } else {
      judul = 'Tambah Produk';
      tombolSubmit = 'Simpan';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _kodeProdukTextField(),
                  _namaProdukTextField(),
                  _hargaProdukTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  buttonSubmit()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _kodeProdukTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  _namaProdukTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  _hargaProdukTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Harga Produk"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value.isEmpty) {
          return "Harga Produk harus diisi";
        }
        return null;
      },
    );
  }

  Widget buttonSubmit() {
    return InkWell(
      onTap: () {
        var validate = _formKey.currentState.validate();
      },
      child: Container(
        width: 200,
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: Colors.black),
        child: Center(
          child: Text(
            tombolSubmit,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
