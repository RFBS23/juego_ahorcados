import 'package:flutter/material.dart';

Widget figure(String path, bool visible) {
  return Container(
    width: 250,
    height: 560,
    child: Visibility(
      visible: visible,
      child: Image.asset(path)
    )
  );

}