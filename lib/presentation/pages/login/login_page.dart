// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_nusa_movie/presentation/extensions/build_context_extension.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_name.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_nusa_movie/presentation/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final userData = ref.watch(userDataProvider);
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed(RouterName.main);
            context.showSnackbar('Login Success');
          }
        } else if (next is AsyncError) {
          context.showSnackbar(next.error.toString());
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            verticalSpace(100),
            Center(
              child: Image.asset(
                "assets/logo.png",
                height: 60,
              ),
            ),
            verticalSpace(50),
            CustomTextField(
              label: 'Email',
              controller: emailController,
            ),
            verticalSpace(20),
            CustomTextField(
              label: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            //forgot password
            verticalSpace(20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: saffron,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            verticalSpace(30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  ref.read(userDataProvider.notifier).login(
                      email: emailController.text,
                      password: passwordController.text);
                },
                child: Text(userData.isLoading ? 'Loading...' : 'Login'),
              ),
            ),
            verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: ghostWhite,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushReplacementNamed(RouterName.register);
                  },
                  child: const Text(
                    ' Register',
                    style: TextStyle(
                      color: saffron,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
