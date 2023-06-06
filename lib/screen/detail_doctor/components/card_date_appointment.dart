import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';

Widget cardDateAppointement({
  required String date,
  required String day,
  required Function() onTap,
  required bool selected,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.6 * SizeConfig.blockSizeVertical!,
        horizontal: 3 * SizeConfig.blockSizeVertical!,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: selected
            ? ColorManager.primaryBlue
            : ColorManager.lightGreyBackgound,
        border: selected
            ? Border.all(
                color: ColorManager.primaryBlue,
              )
            : Border.all(
                color: ColorManager.borderColor,
              ),
      ),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
                fontSize: 2.4 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.bold,
                color:
                    selected ? ColorManager.light : ColorManager.blueGreyText),
          ),
          SizedBox(
            height: 1.4 * SizeConfig.blockSizeVertical!,
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: 1.6 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.bold,
              color: selected ? ColorManager.light : ColorManager.blueGreyText,
            ),
          ),
        ],
      ),
    ),
  );
}
