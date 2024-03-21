import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/extensions/int_extension.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget userInfo(WidgetRef ref) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                    ? NetworkImage(
                            ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                        as ImageProvider
                    : const AssetImage(
                        'assets/pp-placeholder.png',
                      ),
              ),
            ),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${getGreeting()} ${ref.watch(userDataProvider).when(
                      data: (user) => user!.name.split(' ').first,
                      loading: () => 'Loading...',
                      error: (error, stackTrace) =>
                          'Error: ${error.toString()}',
                    )}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Lets book your favorite movie now!',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              verticalSpace(5),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset('assets/wallet.png'),
                    ),
                    horizontalSpace(8),
                    Text(ref.watch(userDataProvider).when(
                          data: (user) => user!.balance.toIDRcurrencyFormat(),
                          loading: () => 'Loading...',
                          error: (error, stackTrace) =>
                              'Error: ${error.toString()}',
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
