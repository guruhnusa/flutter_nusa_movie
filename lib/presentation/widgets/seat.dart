// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';

enum SeatStatus { available, reserved, selected }

class Seat extends StatelessWidget {
  final int? numberSeat;
  final SeatStatus status;
  final double size;
  final VoidCallback onTap;
  const Seat({
    super.key,
    this.numberSeat,
    this.status = SeatStatus.available,
    this.size = 30,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: status == SeatStatus.available
              ? Colors.white
              : status == SeatStatus.reserved
                  ? Colors.grey
                  : saffron,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            numberSeat?.toString() ?? '',
            style: const TextStyle(
              color: background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
