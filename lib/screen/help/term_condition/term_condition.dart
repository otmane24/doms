import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';
import '../../../presentation/laungaes/main.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.termConditionAppBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.6 * SizeConfig.blockSizeVertical!),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                AppLanguage.strings.termConditionText,
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
