import 'package:flutter/material.dart';

import '../../../../assistant_methode/size_config.dart';
import '../../../../presentation/colors/color_manager.dart';

Widget expansionFaqItem({required String name, required String answer}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 2.6 * SizeConfig.blockSizeVertical!,
    ),
    child: ExpansionTile(
      backgroundColor: ColorManager.light,
      collapsedBackgroundColor: ColorManager.light,
      expandedAlignment: Alignment.centerLeft,
      title: Text(
        name,
        style: TextStyle(
          fontSize: 1.6 * SizeConfig.blockSizeVertical!,
          color: ColorManager.darkText,
          fontWeight: FontWeight.w600,
        ),
      ),
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 2.6 * SizeConfig.blockSizeVertical!,
      ),
      tilePadding: EdgeInsets.symmetric(
        horizontal: 2.6 * SizeConfig.blockSizeVertical!,
      ),
      initiallyExpanded: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: ColorManager.primaryBlue,
          width: 1.5,
        ),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: ColorManager.borderColor,
          width: 1,
        ),
      ),
      children: [
        const Divider(
          thickness: 2,
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical!,
        ),
        Text(
          answer,
          style: TextStyle(
            fontSize: 1.6 * SizeConfig.blockSizeVertical!,
            color: ColorManager.dark,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 2 * SizeConfig.blockSizeVertical!,
        ),
      ],
    ),
  );
}
