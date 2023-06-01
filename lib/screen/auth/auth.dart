import 'package:doms/assistant_methode/size_config.dart';
import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/components/buttons/secondary_button.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset('$pngsPath/logo.png'),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 3 * SizeConfig.blockSizeVertical!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  primaryButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.signUpRouter);
                    },
                    text: AppLanguage.strings.signUpButton,
                  ),
                  secondaryButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.signInRouter);
                    },
                    text: AppLanguage.strings.signInButton,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
