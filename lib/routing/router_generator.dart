import 'package:doms/screen/auth/auth.dart';
import 'package:doms/screen/boarding/boarding_screen.dart';
import 'package:doms/screen/sign_in/sign_in.dart';
import 'package:doms/screen/sign_up/add_info_sign_up.dart';
import 'package:doms/screen/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import '../screen/home/home.dart';

import 'app_routing.dart';

class RouterGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouter.authRouter:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
      case AppRouter.onBoardingRouter:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case AppRouter.signInRouter:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case AppRouter.signUpRouter:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case AppRouter.addInfoSignUpRouter:
        return MaterialPageRoute(
          builder: (_) => AddInfoSignUp(),
        );
      case AppRouter.homeRouter:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const MyApp(),
        );
    }
  }

  static Route<dynamic> unDefindedRouter() {
    return MaterialPageRoute(
        builder: ((context) => Scaffold(
              appBar: AppBar(
                title: const Text('Route Not Found'),
              ),
              body: const Center(
                child: Text('Route Not Found'),
              ),
            )));
  }
}
