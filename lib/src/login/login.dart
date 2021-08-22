//import 'package:firebase_auth/firebase_auth.dart';
import 'package:desafio_flutter/src/password/lost_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_flutter/src/logo/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _tedEmail = TextEditingController();
  final _tedSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          logo(context),
          formulario(context),
          SizedBox(
            height: 5,
          ),
          senha(context),
          logar(context),
          welcome(context),
          lostPassword(context),
        ],
      ),
    );
  }

  Container formulario(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Form(
        child: Container(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontFamily: 'semibold', color: Colors.white),
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              helperText: '',
              helperStyle: const TextStyle(color: Colors.white),
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.white),
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              suffixStyle: const TextStyle(color: Colors.white),
            ),
            autofocus: false,
          ),
        ),
      ),
    );
  }

  Container senha(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Form(
        child: Container(
          width: 300,
          child: TextField(
            style: TextStyle(fontFamily: 'semibold', color: Colors.white),
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              helperText: '',
              helperStyle: const TextStyle(color: Colors.white),
              labelText: 'Senha',
              labelStyle: const TextStyle(color: Colors.white),
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              suffixStyle: const TextStyle(color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value == '') {
                return "Login ou Senha Inválida";
              }
            },
            autofocus: false,
            obscureText: true,
          ),
        ),
      ),
    );
  }

  Container logar(BuildContext context) {
    return Container(
      height: 50,
      width: 20,
      margin: EdgeInsets.only(top: 20.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(58.0),
            side: BorderSide(color: Colors.blueAccent),
          ),
        ),
        child: Text(
          'Acessar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: _clickLogin(context),
      ),
    );
  }

  Container welcome(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          'Não tem cadastro? Crie sua conta',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
      ),
    );
  }

  Container lostPassword(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          'Esqueceu sua senha?',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LostPassword()),
          );
        },
      ),
    );
  }

  _clickLogin(BuildContext context) {
    final email = _tedEmail.text;
    final senha = _tedSenha.text;

    print("Email: $email , Senha: $senha ");

    if (!_formKey.currentState.validate()) {
      return;
    }

    if (email.isEmpty || senha.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData(
                dialogBackgroundColor: Colors.black,
                dialogTheme: DialogTheme(backgroundColor: Colors.black)),
            child: CupertinoAlertDialog(
              title: Text("Error"),
              content: Text("E-mail ou Senha inválida"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
