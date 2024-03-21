import 'package:flutter/material.dart';

Widget profileItem(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
    ),
    onTap: onTap,
    trailing: const Icon(Icons.arrow_forward_ios),
  );
}
