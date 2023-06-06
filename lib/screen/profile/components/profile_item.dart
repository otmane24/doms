import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';

Column profileItem({
  required String imagePath,
  required String title,
  required Function() onTap,
  required Color color,
}) {
  return Column(
    children: [
      const Divider(
        thickness: 1,
      ),
      InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(1.6 * SizeConfig.blockSizeVertical!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color.withOpacity(.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    width: 5.8 * SizeConfig.blockSizeVertical!,
                    height: 5.8 * SizeConfig.blockSizeVertical!,
                    child: SvgPicture.asset(imagePath),
                  ),
                  SizedBox(
                    width: 2 * SizeConfig.blockSizeVertical!,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: ColorManager.darkText,
                        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: ColorManager.primaryBlue,
                size: 2.8 * SizeConfig.blockSizeVertical!,
              )
            ],
          ),
        ),
      )
    ],
  );
}
