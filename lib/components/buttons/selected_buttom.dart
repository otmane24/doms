import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget selectedButton(
    {required Widget child,
    required bool selected,
    required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical!,
        horizontal: 2 * SizeConfig.blockSizeVertical!,
      ),
      decoration: BoxDecoration(
        color: selected
            ? ColorManager.primaryBlue
            : ColorManager.lightGreyBackgound,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: ColorManager.primaryBlue,
        ),
      ),
      child: child,
    ),
  );
}
