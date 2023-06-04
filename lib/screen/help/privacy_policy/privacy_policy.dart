import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';
import '../../../presentation/laungaes/main.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.privacyPolicyAppBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.6 * SizeConfig.blockSizeVertical!),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                AppLanguage.strings.privacyPolicyText,
                style: TextStyle(
                  fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
