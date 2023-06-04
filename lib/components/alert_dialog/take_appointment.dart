import 'package:doms/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

showTakeAppointmentDialog({
  required BuildContext context,
  required String imagePath,
  required String massage,
  required String title,
  required String textButton,
  required bool isError,
  required Function() onTap,
}) {
  return AlertDialog(
    contentPadding: EdgeInsets.all(2 * SizeConfig.blockSizeVertical!),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    backgroundColor: ColorManager.light,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 8 * SizeConfig.blockSizeVertical!,
        ),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: isError
                      ? [
                          ColorManager.primaryRed,
                          ColorManager.secondaryRed,
                        ]
                      : [
                          ColorManager.primaryBlue,
                          ColorManager.secondaryBlue,
                        ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: isError
                        ? ColorManager.primaryRed.withOpacity(.8)
                        : ColorManager.primaryBlue.withOpacity(.8),
                    blurRadius: 40,
                  )
                ]),
            constraints: const BoxConstraints(
              minHeight: 40,
              minWidth: 40,
            ),
            height: 8 * SizeConfig.blockSizeVertical!,
            width: 8 * SizeConfig.blockSizeVertical!,
            child: Image.asset(imagePath)),
        SizedBox(
          height: 8 * SizeConfig.blockSizeVertical!,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 2.6 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.w600,
              color:
                  isError ? ColorManager.primaryRed : ColorManager.primaryBlue),
        ),
        SizedBox(
          height: 1.6 * SizeConfig.blockSizeVertical!,
        ),
        Text(
          massage,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 1.6 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.w400,
              color: ColorManager.darkText),
        ),
        SizedBox(
          height: 2.8 * SizeConfig.blockSizeVertical!,
        ),
        primaryButton(onTap: onTap, text: textButton),
        SizedBox(
          height: 1.6 * SizeConfig.blockSizeVertical!,
        ),
      ],
    ),
  );
}
