import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget selectedItem({
  required String text,
  required bool isSelected,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2 * SizeConfig.blockSizeVertical!,
          vertical: 0.8 * SizeConfig.blockSizeVertical!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected
            ? ColorManager.primaryBlue
            : ColorManager.lightGreyBackgound,
        border: Border.all(color: ColorManager.primaryBlue, width: 1.5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 1.8 * SizeConfig.blockSizeVertical!,
            fontWeight: FontWeight.w600,
            color: isSelected ? ColorManager.light : ColorManager.primaryBlue,
          ),
        ),
      ),
    ),
  );
}
