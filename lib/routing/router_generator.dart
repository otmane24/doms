import 'package:flutter/material.dart';

import '../app/app.dart';
import '../screen/home/home.dart';
import 'app_routing.dart';

class RouterGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
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
