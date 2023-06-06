import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';

Widget cardStaticDoctor(
    {required String title,
    required String value,
    required String svgPath,
    required Color color}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(21),
      color: ColorManager.light,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: color.withOpacity(.2),
          ),
          height: 6.4 * SizeConfig.blockSizeVertical!,
          width: 5 * SizeConfig.blockSizeVertical!,
          child: SvgPicture.asset(
            svgPath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 2 * SizeConfig.blockSizeVertical!,
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 1.8 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.bold,
              color: ColorManager.darkBlueText),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical!,
        ),
        Text(
          title,
          style: TextStyle(
            color: ColorManager.blueGreyText,
            fontSize: 1.4 * SizeConfig.blockSizeVertical!,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
