import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:easy_alert/easy_alert.dart';

class Fancybutton extends StatelessWidget {
  final GestureTapCallback onpressed;
  final GestureTapCallback onpressed_a;

  final String button_name ;
  final bool imagenull;
  Fancybutton (this.button_name, this.onpressed, this.onpressed_a, this.imagenull);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(onPressed: (imagenull) ? onpressed : onpressed_a,
      fillColor:  Color.fromRGBO(227, 101, 180, 1.0),
      splashColor: Colors.deepOrange,
      shape: StadiumBorder(),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 370.0,
            height: 30.0,
            child: Center(child: Text(button_name, style: TextStyle(color: Colors.white, fontSize: 16.0), ))),
      ),
    );
  }
}

class Fancybutton2 extends StatelessWidget {
  final GestureTapCallback onpressed;

  final String button_name ;
  Fancybutton2 (this.button_name, this.onpressed, );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(onPressed:  onpressed ,
      fillColor:  Color.fromRGBO(227, 101, 180, 1.0),
      splashColor: Colors.deepOrange,
      shape: StadiumBorder(),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 340.0,
            height: 30.0,
            child: Center(child: Text(button_name, style: TextStyle(color: Colors.white, fontSize: 16.0), ))),
      ),
    );
  }
}