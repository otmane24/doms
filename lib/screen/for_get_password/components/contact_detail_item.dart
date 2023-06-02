import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';

Widget contactDetailItem({
  required String text,
  required String imagePath,
  required Function() onTap,
  required String contact,
  required bool isSelected,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(2.4 * SizeConfig.blockSizeVertical!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        border: Border.all(
          color:
              isSelected ? ColorManager.primaryBlue : ColorManager.borderColor2,
          width: isSelected ? 2 : 1,
        ),
        color: ColorManager.light,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                90,
              ),
              color: ColorManager.primaryBlue.withOpacity(.1),
            ),
            height: 8 * SizeConfig.blockSizeVertical!,
            width: 8 * SizeConfig.blockSizeVertical!,
            child: Image.asset(
              imagePath,
            ),
          ),
          SizedBox(
            width: 2 * SizeConfig.blockSizeVertical!,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              SizedBox(
                height: .8 * SizeConfig.blockSizeVertical!,
              ),
              Text(
                contact,
                style: TextStyle(
                  color: ColorManager.dark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
