import 'dart:ffi';

import 'package:flutter/material.dart';

import '../const.dart';

class CalButton extends StatelessWidget {
  const CalButton({
    Key? key,
    this.number = "0",
    this.fillColor = 0,
    this.textColor = 0XFFEEEEEE,
    required this.press,
  }) : super(key: key);

  final String number;
  final int fillColor;
  final int textColor;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        press(number);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Color(fillColor),
        minimumSize: const Size(65, 65),
      ),
      child: Text(
        number,
        style: fontStyle.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Color(textColor),
        ),
      ),
    );
  }
}
