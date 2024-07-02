import 'package:flutter/material.dart';

Widget containerButtonBuild({
  required BuildContext context,
  required  double width,
  required double height,
  required  EdgeInsetsGeometry padding,
  required  Widget child
}) {
  return Padding(
    padding: padding,
    child: SizedBox(
        width: width,
        height: height,
        child: child
    ),
  );
}