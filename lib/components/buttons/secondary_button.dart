import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget secondaryButton({required Function() onTap, required String text}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 5.4 * SizeConfig.blockSizeVertical!,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primaryBlue,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: ColorManager.primaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
