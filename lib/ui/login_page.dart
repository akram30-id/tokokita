import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tokokita/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _secureText = true;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _title(),
                  _emailTextField(),
                  _passwordTextField(),
                  SizedBox(
                    height: 30,
                  ),
                  _buttonLogin(),
                  SizedBox(
                    height: 30,
                  ),
                  _menuRegistrasi()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _title() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.account_circle_outlined,
          size: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Masukkan email dan password \nuntuk melanjutkan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        )
      ],
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

  Widget _buttonLogin() {
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
            'Login',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _menuRegistrasi() {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Belum punya akun ? "),
            SizedBox(
              height: 5,
            ),
            InkWell(
              child: Text(
                "Register",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: RegistrasiPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
          ],
        ),
      ),
    );
  }
}
