import 'package:doms/screen/auth/auth.dart';
import 'package:doms/screen/boarding/boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../assistant_methode/hivebase.dart';
import '../assistant_methode/size_config.dart';
import '../businnes_logic/cubit/app_language_cubit.dart';
import '../presentation/colors/color_manager.dart';
import '../presentation/laungaes/main.dart';
import '../routing/router_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppLanguage.setStrings(context.watch<AppLanguageCubit>().state);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLanguage.strings.nameApp,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.lightGreyBackgound,
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: ColorManager.blueText,
                fontSize: 2.2 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.w600),
            backgroundColor: ColorManager.light,
            elevation: 0,
            iconTheme: IconThemeData(color: ColorManager.primaryBlue),
          ),
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(
              color: ColorManager.redError,
              fontSize: 1.4 * SizeConfig.blockSizeVertical!,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.redError, width: 1.2),
              borderRadius: BorderRadius.circular(32),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.hintText, width: 1),
              borderRadius: BorderRadius.circular(32),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primaryBlue, width: 1),
              borderRadius: BorderRadius.circular(32),
            ),
          )),
      onGenerateRoute: RouterGenerator.getRouter,
      home: HiveBase.hiveBase.getOnBoadringShow() == true
          ? const AuthScreen()
          : const OnBoardingScreen(),
    );
  }
}
