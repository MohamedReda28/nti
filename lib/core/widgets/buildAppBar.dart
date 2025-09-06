import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF0C0D0D) /* Grayscale-950 */,
        fontSize: 19,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.arrow_back_ios)),
    ),
    leadingWidth: 35,
  );
}
