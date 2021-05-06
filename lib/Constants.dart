import 'package:flutter/material.dart';

Color bgColor = Color(0xff2e2e2e);
Color mainColor = Color(0xeeffffff);
Color secColor = Color(0x80ffffff);

TextStyle secStyle(_width) {
  return TextStyle(
      color: secColor, fontWeight: FontWeight.w400, fontSize: _width * .04);
}

TextStyle mainStyle(_width) {
  return TextStyle(
      color: mainColor, fontWeight: FontWeight.w500, fontSize: _width * .05);
}

TextStyle tempStyle(_width) {
  return TextStyle(
      color: mainColor,
      fontSize: _width*.08,
      fontWeight: FontWeight.bold
  );
}

