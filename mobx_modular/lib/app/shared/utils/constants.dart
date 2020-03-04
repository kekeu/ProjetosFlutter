import 'package:flutter/material.dart';

const String URL_BASE = 'https://pokeapi.co/api/v2/';

BoxDecoration MyBoxDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Colors.blue[100], Colors.blue[400]],
    ),
  );
}

