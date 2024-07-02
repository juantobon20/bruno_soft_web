import 'package:flutter/material.dart';

Widget containerTextFieldBuild({
  required EdgeInsetsGeometry padding,
  required double width,
  required Widget textField
}){
  return Padding(
    padding: padding,
    child: SizedBox(
      width: width,
      child: textField
    ),
  );
}