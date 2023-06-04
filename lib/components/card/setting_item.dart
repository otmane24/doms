import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget settingItem({
  required String name,
  required bool notificationSetting,
  required Function(bool) onChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 2 * SizeConfig.blockSizeVertical!,
    ),
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
        Switch.adaptive(
            value: notificationSetting,
            activeColor: ColorManager.primaryBlue,
            onChanged: onChanged)
      ],
    ),
  );
}
