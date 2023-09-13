import 'package:flutter/material.dart';

Widget myText(
  String label, {
  double scale = 1,
}) {
  return Container(
    child: Text(
      label,
      textScaleFactor: scale,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontStyle: FontStyle.normal,
      ),
      //textAlign: TextAlign.center,
    ),
  );
}
