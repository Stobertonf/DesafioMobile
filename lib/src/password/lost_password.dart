//import 'dart:js';

import 'package:desafio_flutter/src/login/login.dart';
import 'package:desafio_flutter/src/logo/logo.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class LostPassword extends StatelessWidget {
  final _tedLogin = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formMensagemKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueci a senha"),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          tooltip: 'Voltar',
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            )
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            _icon(context),
            Divider(
              color: Colors.white,
            ),
            _menssagem(context),
            Divider(
              color: Colors.white,
            ),
            textFormFieldEmail(),
            Divider(
              color: Colors.white,
            ),
            _enviarSenha(context),
            Divider(
              color: Colors.white,
            ),
            SizedBox(height: 150),
            suporte(context),
            Divider(
              color: Colors.white,
            ),
          ],
        ));
  }

  //Icone

  _icon(BuildContext context) {
    return Container(
      child: Icon(
        Icons.person_outline,
        size: 120.0,
        color: Colors.black,
      ),
    );
  }

  _img(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/imagens/smf.png'),
          ),
        ],
      ),
    );
  }

//Mensagem

  Container _menssagem(BuildContext context) {
    return Container(
      key: _formMensagemKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Informe o seu e-mail e receba informações para redefinir a sua senha",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontFamily: 'RobotoMono'),
          ),
        ],
      ),
    );
  }

  //Enviar Senha
  Container _enviarSenha(BuildContext context) {
    return Container(
      height: 50.0,
      width: 20,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
        ),
        child: Text(
          "Enviar",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        onPressed: () {
          _clickLogin(context);
        },
      ),
    );
  }

  //Container Ajuda
  Container ajuda(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(58.0),
            side: BorderSide(color: Colors.white),
          ),
        ),
        child: Text(
          "SMF Systems Technology",
          style: TextStyle(color: Colors.blue, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onPressed: () {},
      ),
    );
  }

  Container suporte(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Suporte - ( 11 ) 99422 - 3176",
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }

  Container textFormFieldEmail() {
    return Container(
      child: Form(
        autovalidate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              //   controller: name,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.black),
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Informe seu e-mail";
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _clickLogin(BuildContext context) {
    final email = _tedLogin.text;
    //final senha = _tedSenha.text;

    print("Email: $email "); //, Senha: $senha ");

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Sucesso", textAlign: TextAlign.center),
              content: Text("Um e-mail foi enviado para a sua conta."),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    }
  }
}
