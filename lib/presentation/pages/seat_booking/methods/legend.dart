import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/widgets/seat.dart';

Widget legend() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Seat(
          status: SeatStatus.available,
          size: 20,
          onTap: () {},
        ),
        horizontalSpace(10),
        const Text(
          'Available',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        horizontalSpace(10),
        Seat(
          status: SeatStatus.selected,
          size: 20,
          onTap: () {},
        ),
        horizontalSpace(10),
        const Text(
          'Selected',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        horizontalSpace(10),
        Seat(
          status: SeatStatus.reserved,
          size: 20,
          onTap: () {},
        ),
        horizontalSpace(10),
        const Text(
          'Reserved',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
