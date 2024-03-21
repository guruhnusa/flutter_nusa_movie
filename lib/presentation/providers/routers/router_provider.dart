import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:flutter_nusa_movie/presentation/pages/detail/detail_page.dart';
import 'package:flutter_nusa_movie/presentation/pages/login/login_page.dart';
import 'package:flutter_nusa_movie/presentation/pages/main/main_page.dart';
import 'package:flutter_nusa_movie/presentation/pages/register/register_page.dart';
import 'package:flutter_nusa_movie/presentation/pages/seat_booking/seat_boking_page.dart';
import 'package:flutter_nusa_movie/presentation/pages/time_booking/time_booking_page.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_name.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    initialLocation: RouterName.login,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/main',
        name: RouterName.main,
        builder: (context, state) {
          return const MainPage();
        },
      ),
      GoRoute(
        path: '/login',
        name: RouterName.login,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/register',
        name: RouterName.register,
        builder: (context, state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        path: '/detail',
        name: RouterName.detail,
        builder: (context, state) {
          return DetailPage(
            movie: state.extra as MovieModel,
          );
        },
      ),
      GoRoute(
        path: '/timeBooking',
        name: RouterName.timeBooking,
        builder: (context, state) {
          return TimeBookingPage(
            movieDetail: state.extra as MovieDetailModel,
          );
        },
      ),
      GoRoute(
        path: '/seatBooking',
        name: RouterName.seatBooking,
        builder: (context, state) {
          final transationDetail =
              state.extra as (MovieDetailModel, TransactionModel);
          return SeatBookingPage(
            transationDetail: transationDetail,
          );
        },
      ),
    ],
  );
}
