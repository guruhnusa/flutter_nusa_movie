import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:flutter_nusa_movie/presentation/extensions/build_context_extension.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/pages/time_booking/methods/option_select.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_name.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_nusa_movie/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter_nusa_movie/presentation/widgets/network_image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:intl/intl.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  final MovieDetailModel movieDetail;
  const TimeBookingPage({
    super.key,
    required this.movieDetail,
  });

  @override
  ConsumerState<TimeBookingPage> createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
  final List<String> teatherOptions = [
    'CGV Solo Baru',
    'XXI Solo Square',
    'Cineplex GrandMall',
    'XXI The Park Mall',
  ];

  final List<DateTime> dates = List.generate(7, (index) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return date.add(Duration(days: index));
  });

  final List<int> times = List.generate(8, (index) => index + 15);

  String? selectedTeather;
  DateTime? selectedDate;
  int? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: BackNavigationBar(
                  title: widget.movieDetail.title,
                  onTap: () {
                    ref.read(routerProvider).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 48,
                  height: (MediaQuery.of(context).size.width - 48) * 0.6,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${widget.movieDetail.backdropPath ?? widget.movieDetail.posterPath}',
                  fit: BoxFit.cover,
                  borderRadius: 15,
                ),
              ),
              ...optionSelect<String>(
                title: 'Select a Teather',
                options: teatherOptions,
                selectedOption: selectedTeather,
                onTap: (String object) {
                  setState(() {
                    selectedTeather = object;
                    selectedDate = null;
                    selectedTime = null;
                  });
                },
              ),
              verticalSpace(24),
              ...optionSelect<DateTime>(
                title: 'Select a Date',
                options: dates,
                selectedOption: selectedDate,
                converter: (DateTime object) {
                  return DateFormat('EEE, d MMMM y').format(object);
                },
                onTap: (DateTime object) {
                  setState(() {
                    selectedDate = object;
                    selectedTime = null;
                  });
                },
                isOptionEnable: (object) => selectedTeather != null,
              ),
              verticalSpace(24),
              ...optionSelect<int>(
                title: 'Select a Time',
                options: times,
                selectedOption: selectedTime,
                converter: (int object) {
                  return '$object:00';
                },
                onTap: (int object) {
                  setState(() {
                    selectedTime = object;
                  });
                },
                isOptionEnable: (hour) =>
                    selectedDate != null &&
                    DateTime(selectedDate!.year, selectedDate!.month,
                            selectedDate!.day, hour)
                        .isAfter(DateTime.now()),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: saffron,
                foregroundColor: background,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (selectedTeather == null &&
                    selectedDate == null &&
                    selectedTime == null) {
                  context.showSnackbar('Please select all options');
                } else {
                  TransactionModel transaction = TransactionModel(
                    uid: ref.read(userDataProvider).value!.uid,
                    title: widget.movieDetail.title,
                    adminFee: 3000,
                    total: 0,
                    watchingTime: DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedTime!,
                    ).millisecondsSinceEpoch,
                    transactionImage: widget.movieDetail.posterPath,
                    theaterName: selectedTeather,
                  );
                  ref.read(routerProvider).pushNamed(
                    RouterName.seatBooking,
                    extra: (widget.movieDetail, transaction),
                  );
                }
              },
              child: const Text('Next',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ));
  }
}
