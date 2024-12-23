import 'package:flutter/material.dart';

class StyleText {
  TextStyle textstyle1 = const TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );
  TextStyle textstyle2 = TextStyle(
    color: Colors.white.withOpacity(.5),
    fontSize: 22,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 2,
  );
}
