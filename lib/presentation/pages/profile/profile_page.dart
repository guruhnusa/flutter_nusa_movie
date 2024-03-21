import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/pages/profile/methods/profile_item.dart';
import 'package:flutter_nusa_movie/presentation/pages/profile/methods/user_info.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDataProvider);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...userInfo(ref),
            const Divider(),
            profileItem('Update', () {}),
            profileItem('My Wallet', () {}),
            profileItem('Change Password', () {}),
            profileItem('Change Languange', () {}),
            const Divider(),
            profileItem('Contact Us', () {}),
            profileItem('Privacy Policy', () {}),
            profileItem('Term and Conditions', () {}),
            verticalSpace(20),
            ElevatedButton(
              onPressed: () {
                ref.read(userDataProvider.notifier).logout();
              },
              child: Text(user.isLoading ? 'Loading...' : 'Logout'),
            )
          ],
        ),
      ),
    );
  }
}
