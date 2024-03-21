import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';

Widget movieScreen() {
  return Container(
    height: 50,
    width: 250,
    margin: const EdgeInsets.only(top: 24, bottom: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [saffron.withOpacity(0.33), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 3,
          color: saffron,
        )),
  );
}
