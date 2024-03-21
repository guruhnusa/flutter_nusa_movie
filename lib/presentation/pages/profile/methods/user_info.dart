import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> userInfo(WidgetRef ref) => [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          image: DecorationImage(
            image: NetworkImage(
              ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                  ? ref.watch(userDataProvider).valueOrNull!.photoUrl!
                  : 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
            ),
            fit: BoxFit.contain,
          ),
          shape: BoxShape.circle,
        ),
      ),
      verticalSpace(20),
      Text(
        ref.watch(userDataProvider).valueOrNull?.name ?? '',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        ref.watch(userDataProvider).valueOrNull?.email ?? '',
        style: const TextStyle(
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    ];
