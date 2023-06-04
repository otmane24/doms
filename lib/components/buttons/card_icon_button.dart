import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget cardIconButton(
    {required String imagePath,
    required Function() onTap,
    double? width,
    double? height}) {
  return InkWell(
    onTap: onTap,
    child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorManager.primaryBlue.withOpacity(0.1),
        ),
        constraints: const BoxConstraints(
          minHeight: 40,
          minWidth: 40,
        ),
        height: height ?? 4.4 * SizeConfig.blockSizeVertical!,
        width: width ?? 4.4 * SizeConfig.blockSizeVertical!,
        child: SvgPicture.asset(imagePath)),
  );
}
