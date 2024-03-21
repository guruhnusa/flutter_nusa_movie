import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/pages/seat_booking/methods/legend.dart';
import 'package:flutter_nusa_movie/presentation/pages/seat_booking/methods/movie_screen.dart';
import 'package:flutter_nusa_movie/presentation/pages/seat_booking/methods/seat_section.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_provider.dart';
import 'package:flutter_nusa_movie/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter_nusa_movie/presentation/widgets/seat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetailModel, TransactionModel) transationDetail;
  const SeatBookingPage({
    super.key,
    required this.transationDetail,
  });

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  List<int> selectedSeat = [];
  List<int> reservedSeat = [];

  @override
  void initState() {
    Random random = Random();
    int reservedNumber = random.nextInt(36) + 1;
    while (reservedSeat.length < 8) {
      if (!reservedSeat.contains(reservedNumber)) {
        reservedSeat.add(reservedNumber);
      }
      reservedNumber = random.nextInt(36) + 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transationDetail;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  BackNavigationBar(
                    title: movieDetail.title,
                    onTap: () {
                      ref.read(routerProvider).pop();
                    },
                  ),
                  movieScreen(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      seatSection(
                          seatNumber: List.generate(18, (index) => index + 1),
                          onTap: onSeatTap,
                          seatStatusChecker: seatStatusChecker),
                      const SizedBox(width: 20),
                      seatSection(
                          seatNumber: List.generate(18, (index) => index + 19),
                          onTap: onSeatTap,
                          seatStatusChecker: seatStatusChecker),
                    ],
                  ),
                  verticalSpace(20),
                  legend(),
                  verticalSpace(20),
                  Text(
                    'Selected Seat : ${selectedSeat.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: saffron,
                  foregroundColor: background,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text('Next',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onSeatTap(seatNumber) {
    if (selectedSeat.contains(seatNumber)) {
      selectedSeat.remove(seatNumber);
    } else {
      selectedSeat.add(seatNumber);
    }
    setState(() {});
  }

  SeatStatus seatStatusChecker(seatNumber) {
    if (reservedSeat.contains(seatNumber)) {
      return SeatStatus.reserved;
    } else if (selectedSeat.contains(seatNumber)) {
      return SeatStatus.selected;
    } else {
      return SeatStatus.available;
    }
  }
}
