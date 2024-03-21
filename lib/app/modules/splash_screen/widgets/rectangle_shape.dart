import 'package:flutter/material.dart';

Widget rectangleSape(Color color) {
  return Container(
    width: 250,
    height: 200,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.rectangle,
    ),
  );
}
