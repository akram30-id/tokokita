import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _secureText = true;

  final _namaTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _namaTextField(),
                    SizedBox(
                      height: 10,
                    ),
                    _emailTextField(),
                    SizedBox(
                      height: 10,
                    ),
                    _passwordTextField(),
                    SizedBox(
                      height: 10,
                    ),
                    _passwordKonfirmasiTextField(),
                    SizedBox(
                      height: 50,
                    ),
                    buttonRegistrasi(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama"),
      keyboardType: TextInputType.text,
      controller: _namaTextController,
      validator: (value) {
        if (value.length < 3) {
          return "Nama harus diisi minimal 4 karakter";
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.text,
      controller: _emailTextController,
      validator: (value) {
        Pattern pattern = r'^\d+(?:\.\d+)?$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return 'Email tidak valid';
        }
        if (value.isEmpty) {
          return "Email harus diisi";
        }
        return null;
      },
    );
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
            onPressed: showHide,
            icon: Icon(
              _secureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          )),
      keyboardType: TextInputType.text,
      obscureText: _secureText,
      controller: _passwordTextController,
      validator: (value) {
        if (value.length < 6) {
          return "Password minimal 6 karakter";
        }
        return null;
      },
    );
  }

  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Konfirmasi Password",
          suffixIcon: IconButton(
            onPressed: showHide,
            icon: Icon(
              _secureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          )),
      keyboardType: TextInputType.text,
      obscureText: _secureText,
      validator: (value) {
        if (value != _passwordTextController.text) {
          return "Konfirmasi password tidak sama";
        }
        return null;
      },
    );
  }

  submit() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  Widget buttonRegistrasi() {
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
            'Registrasi',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
