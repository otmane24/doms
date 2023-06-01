import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'assistant_methode/hivebase.dart';

import 'businnes_logic/cubit/app_language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await HiveBase.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppLanguageCubit>(
          create: (context) =>
              AppLanguageCubit(HiveBase.hiveBase.getLanguage() ?? "En"),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
