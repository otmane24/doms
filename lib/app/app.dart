import 'package:doms/screen/home/home.dart';
import 'package:flutter/material.dart';

import '../presentation/laungaes/main.dart';
import '../routing/router_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLanguage.strings.nameApp,
      onGenerateRoute: RouterGenerator.getRouter,
      home: const Home(),
    );
  }
}
