import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';
import 'fee_information_object.dart';

Widget feeInformationCard({
  required FeeInformationObject feeInformation,
  required Function() onTap,
  required bool isSelected,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 1.6 * SizeConfig.blockSizeVertical!,
        horizontal: 2.4 * SizeConfig.blockSizeVertical!,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorManager.primaryBlue
            : ColorManager.lightGreyBackgound,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorManager.borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorManager.light
                      : ColorManager.primaryBlue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(90),
                ),
                padding: EdgeInsets.all(1.6 * SizeConfig.blockSizeVertical!),
                child: Image.asset(
                  feeInformation.imagePath,
                  width: 2.6 * SizeConfig.blockSizeVertical!,
                  height: 2.6 * SizeConfig.blockSizeVertical!,
                ),
              ),
              SizedBox(
                width: 1.6 * SizeConfig.blockSizeVertical!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feeInformation.title,
                    style: TextStyle(
                      color: isSelected
                          ? ColorManager.light
                          : ColorManager.darkText,
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: .4 * SizeConfig.blockSizeVertical!,
                  ),
                  Text(
                    feeInformation.subTitle,
                    style: TextStyle(
                      color: isSelected
                          ? ColorManager.light
                          : ColorManager.darkText,
                      fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            feeInformation.price,
            style: TextStyle(
              color: isSelected ? ColorManager.light : ColorManager.primaryBlue,
              fontSize: 2.4 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
