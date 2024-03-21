import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';

Widget searchBar(BuildContext context) => Row(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 24 - 24 - 90,
          margin: const EdgeInsets.only(left: 24, right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: const Color(0xFF252836),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search movie...',
              hintStyle: TextStyle(
                color: Color(0xFF6E788A),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 80,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Center(
              child: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
