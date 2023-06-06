import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../constants/strings/constants_strings.dart';
import '../../../presentation/colors/color_manager.dart';

Widget socialButton({required String nameButton, required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding:
          EdgeInsets.symmetric(horizontal: 1.6 * SizeConfig.blockSizeVertical!),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.lightGrey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 52,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            '$pngsPath/${nameButton.toLowerCase()}.png',
            width: 3.2 * SizeConfig.blockSizeVertical!,
            height: 3.2 * SizeConfig.blockSizeVertical!,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            nameButton,
            style: TextStyle(
              color: ColorManager.darkText,
              fontSize: 1.6 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
