import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/extensions/build_context_extension.dart';
import 'package:flutter_nusa_movie/presentation/pages/movie/movie_page.dart';
import 'package:flutter_nusa_movie/presentation/pages/profile/profile_page.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_name.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_nusa_movie/presentation/widgets/bottom_navbar.dart';
import 'package:flutter_nusa_movie/presentation/widgets/buttom_navbar_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed(RouterName.login);
      } else if (next is AsyncError) {
        context.showSnackbar(next.error.toString());
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: const [
              MoviePage(),
              Center(
                child: Text('Ticket Page'),
              ),
              ProfilePage(),
            ],
          ),
          BottomNavBar(
            items: [
              BottomNavBarItem(
                index: 0,
                isSelected: selectedIndex == 0,
                title: 'Home',
                image: 'assets/navbar/movie.png',
                selectedImage: 'assets/navbar/movie-selected.png',
              ),
              BottomNavBarItem(
                index: 1,
                isSelected: selectedIndex == 1,
                title: 'Ticket',
                image: 'assets/navbar/ticket.png',
                selectedImage: 'assets/navbar/ticket-selected.png',
              ),
              BottomNavBarItem(
                index: 2,
                isSelected: selectedIndex == 2,
                title: 'Profile',
                image: 'assets/navbar/profile.png',
                selectedImage: 'assets/navbar/profile-selected.png',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            selectedIndex: 0,
          )
        ],
      ),
    );
  }
}
