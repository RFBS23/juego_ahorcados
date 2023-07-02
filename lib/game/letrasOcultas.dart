import 'package:ahorcados/const/consts.dart';
import 'package:flutter/material.dart';

Widget letrasOcultas(String char, bool visible) {
  return Container(
    alignment: Alignment.center,
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.white,
    ),
    child: Visibility(
      visible: !visible,
      child: Text(
        char,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColors.bgColor,
        ),
      ),
    ),
  );
}