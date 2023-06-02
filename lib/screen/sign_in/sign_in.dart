import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/components/text_field/primary_text_field.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/screen/sign_in/components/social_button.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/text_field/obscure_text_field.dart';
import '../../routing/app_routing.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.top,
            horizontal: 2.4 * SizeConfig.blockSizeVertical!,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 4 * SizeConfig.blockSizeVertical!,
              ),
              Image.asset(
                '$pngsPath/logo.png',
                width: 10 * SizeConfig.blockSizeVertical!,
                height: 10 * SizeConfig.blockSizeVertical!,
              ),
              SizedBox(
                height: 2 * SizeConfig.blockSizeVertical!,
              ),
              Text(
                AppLanguage.strings.signInText,
                style: TextStyle(
                    fontSize: 2.4 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4 * SizeConfig.blockSizeVertical!,
              ),
              primaryTextField(name: AppLanguage.strings.emailTextField),
              SizedBox(
                height: 1.6 * SizeConfig.blockSizeVertical!,
              ),
              obscureTextField(
                  name: AppLanguage.strings.passwordTextField,
                  controller: passwordController),
              SizedBox(
                height: 4 * SizeConfig.blockSizeVertical!,
              ),
              primaryButton(
                onTap: () {
                  // Navigator.pushNamed(context, AppRouter.signInRouter);
                },
                text: AppLanguage.strings.signInButton,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical!,
              ),
              TextButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRouter.forGetPasswordRouter),
                child: Text(
                  AppLanguage.strings.forGetPasswordText,
                  style: TextStyle(
                    color: ColorManager.primaryBlue,
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 2 * SizeConfig.blockSizeVertical!,
              ),
              Text(
                AppLanguage.strings.orContinueWithText,
                style: TextStyle(
                  color: ColorManager.darkText,
                  fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 2 * SizeConfig.blockSizeVertical!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: socialButton(nameButton: 'Facebook'),
                  ),
                  SizedBox(
                    width: 3 * SizeConfig.blockSizeVertical!,
                  ),
                  Expanded(
                    child: socialButton(nameButton: 'Google'),
                  ),
                ],
              ),
              SizedBox(
                height: 5 * SizeConfig.blockSizeVertical!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLanguage.strings.dontHaveAccountText,
                      style: TextStyle(
                        color: ColorManager.darkGrey,
                        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.w500,
                      )),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.signUpRouter),
                    child: Text(AppLanguage.strings.signUpText,
                        style: TextStyle(
                          color: ColorManager.primaryBlue,
                          fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
