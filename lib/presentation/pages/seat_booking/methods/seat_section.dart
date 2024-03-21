import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/widgets/seat.dart';

Widget seatSection({
  required List<int> seatNumber,
  required void Function(int seatNumber) onTap,
  required SeatStatus Function(int seatNumber) seatStatusChecker,
}) =>
    SizedBox(
      height: 240,
      width: 110,
      child: Wrap(
        spacing: 10,
        runAlignment: WrapAlignment.spaceBetween,
        children: seatNumber
            .map((number) => Seat(
                  numberSeat: number,
                  status: seatStatusChecker(number),
                  onTap: () => onTap(number),
                ))
            .toList(),
      ),
    );
