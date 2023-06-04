import 'package:doms/screen/notification/components/notification_object.dart';
import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';

Widget notificationItem({required NotificationObject notificationObject}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!),
    padding: EdgeInsets.symmetric(
      vertical: 1.4 * SizeConfig.blockSizeVertical!,
      horizontal: 2 * SizeConfig.blockSizeVertical!,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Image.asset(
          notificationObject.image,
        ),
        SizedBox(
          width: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                notificationObject.title,
                style: TextStyle(
                    color: ColorManager.darkText,
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: .5 * SizeConfig.blockSizeVertical!,
              ),
              Text(
                notificationObject.body,
                style: TextStyle(
                  color: ColorManager.darkText.withOpacity(.5),
                  fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
