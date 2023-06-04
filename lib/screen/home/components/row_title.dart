import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';

Widget rowTitleHome({required String title, required Function() onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 1.8 * SizeConfig.blockSizeVertical!,
          fontWeight: FontWeight.w600,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          'View all',
          style: TextStyle(
            fontSize: 1.8 * SizeConfig.blockSizeVertical!,
            fontWeight: FontWeight.w600,
            color: ColorManager.primaryText,
          ),
        ),
      ),
    ],
  );
}
