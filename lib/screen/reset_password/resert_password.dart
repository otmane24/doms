import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/text_field/obscure_text_field.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfrimPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLanguage.strings.resetPasswordAppBarText),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.4 * SizeConfig.blockSizeVertical!),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLanguage.strings.createNewPasswordText,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      color: ColorManager.dark,
                    ),
                  ),
                  SizedBox(
                    height: 2.4 * SizeConfig.blockSizeVertical!,
                  ),
                  obscureTextField(
                      name: AppLanguage.strings.passwordTextField,
                      controller: passwordController),
                  SizedBox(
                    height: 2.4 * SizeConfig.blockSizeVertical!,
                  ),
                  obscureTextField(
                      name: AppLanguage.strings.confirmPasswordTextField,
                      controller: ConfrimPasswordController),
                ],
              ),
              primaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                          context, AppRouter.addInfoSignUpRouter);
                    }
                  },
                  text: AppLanguage.strings.continueButton)
            ],
          ),
        ),
      ),
    );
  }
}
