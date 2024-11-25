import 'package:deled_new_app/pages/home_page.dart';
import 'package:deled_new_app/pages/loginscreen.dart';
import 'package:deled_new_app/services/authentication_service.dart';
import 'package:flutter/material.dart';

class Authchecker extends StatelessWidget {
  const Authchecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthenticationService().authStatechanges(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
