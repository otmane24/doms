import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/components/text_field/multi_line_text_field.dart';
import 'package:doms/components/text_field/primary_text_field.dart';
import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';
import '../../../presentation/laungaes/main.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.contactUsHelpText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.6 * SizeConfig.blockSizeVertical!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                primaryTextField(
                  name: AppLanguage.strings.fullNameTextField,
                ),
                SizedBox(
                  height: 2 * SizeConfig.blockSizeVertical!,
                ),
                primaryTextField(
                  name: AppLanguage.strings.emailTextField,
                ),
                SizedBox(
                  height: 2 * SizeConfig.blockSizeVertical!,
                ),
                multiLineTextField(name: 'Message')
              ],
            ),
            primaryButton(
                onTap: () {}, text: AppLanguage.strings.sendMessageButton)
          ],
        ),
      ),
    );
  }
}
