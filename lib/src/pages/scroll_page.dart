import 'package:disenos/src/pages/botones_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class ScrollPage extends StatelessWidget {
  @override
  String _correo;
  String _contrasena;
  String mensaje = '';
  bool _logueado = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _login(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(242, 245, 241, 1.0),
            Color.fromRGBO(196, 196, 196, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(3, 72, 0, 1.0),
                Color.fromRGBO(20, 245, 9, 1.0)
              ])),
        ));

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('HURONCONNECT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Inicio de Sesión',
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  Widget _login(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
        Container(
          width: 300.0, //size.width * .6,
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (text) {
                    if (text.length == 0) {
                      return "Este campo correo es requerido";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Correo',
                    labelText: 'Correo',
                    counterText: '',
                    icon: Icon(
                      Icons.email,
                      size: 32.0,
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                  ),
                  onSaved: (text) => _correo = text,
                ),
                TextFormField(
                  validator: (text) {
                    if (text.length == 0) {
                      return "Este campo contraseña es requerido";
                    } else if (text.length <= 5) {
                      return "Su contraseña debe ser al menos de 5 caracteres";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Contraseña',
                    labelText: 'Contraseña',
                    counterText: '',
                    icon: Icon(
                      Icons.lock,
                      size: 32.0,
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                  ),
                  onSaved: (text) => _contrasena = text,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => BotonesPage()));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 42.0,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
