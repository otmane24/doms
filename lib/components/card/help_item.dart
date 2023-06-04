import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget helpItem({
  required String name,
  required Function() onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 2 * SizeConfig.blockSizeVertical!,
      vertical: SizeConfig.blockSizeVertical!,
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                color: ColorManager.darkText,
                fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 2.6 * SizeConfig.blockSizeVertical!,
            color: ColorManager.primaryBlue,
          )
        ],
      ),
    ),
  );
}
