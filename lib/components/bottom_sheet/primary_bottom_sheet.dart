import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

primaryBottomSheet(
    {required BuildContext context,
    required Widget body,
    required String title,
    required String cancelText,
    required String confrimText,
    required Function() onCancel,
    required Function() onConfrim}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(32),
      topRight: Radius.circular(32),
    )),
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2.4 * SizeConfig.blockSizeVertical!,
              vertical: 3.6 * SizeConfig.blockSizeVertical!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              body,
              SizedBox(height: 3.2 * SizeConfig.blockSizeVertical!),
              Text(
                title,
                style: TextStyle(
                    fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.dark),
              ),
              SizedBox(height: 3.2 * SizeConfig.blockSizeVertical!),
              Row(
                children: [
                  Expanded(
                    child: secondaryButton(onTap: onCancel, text: cancelText),
                  ),
                  SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
                  Expanded(
                    child: primaryButton(onTap: onConfrim, text: confrimText),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
