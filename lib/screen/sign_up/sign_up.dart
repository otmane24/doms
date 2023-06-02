import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/components/text_field/primary_text_field.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/text_field/obscure_text_field.dart';
import '../../routing/app_routing.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfrimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top,
          horizontal: 3 * SizeConfig.blockSizeVertical!,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                AppLanguage.strings.signUpText,
                style: TextStyle(
                    fontSize: 2.4 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5 * SizeConfig.blockSizeVertical!,
              ),
              primaryTextField(name: AppLanguage.strings.emailTextField),
              SizedBox(
                height: 1.6 * SizeConfig.blockSizeVertical!,
              ),
              obscureTextField(
                  name: AppLanguage.strings.passwordTextField,
                  controller: passwordController),
              SizedBox(
                height: 1.6 * SizeConfig.blockSizeVertical!,
              ),
              obscureTextField(
                  name: AppLanguage.strings.confirmPasswordTextField,
                  controller: ConfrimPasswordController),
              SizedBox(
                height: 4 * SizeConfig.blockSizeVertical!,
              ),
              primaryButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.addInfoSignUpRouter);
                },
                text: AppLanguage.strings.nextButton,
              ),
              SizedBox(
                height: 5 * SizeConfig.blockSizeVertical!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLanguage.strings.haveAccountText,
                      style: TextStyle(
                        color: ColorManager.darkGrey,
                        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.w500,
                      )),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.signInRouter),
                    child: Text(AppLanguage.strings.signInText,
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
