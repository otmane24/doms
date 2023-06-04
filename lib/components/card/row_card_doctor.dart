import 'package:doms/screen/home/components/top_doctor_object.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';
import '../buttons/card_icon_button.dart';

Widget rowCardDoctor({required DoctorObject topDoctorObject, bool? isLiked}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorManager.borderColor,
      ),
      color: ColorManager.light,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(topDoctorObject.imagePath,
                width: 100, height: 100, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topDoctorObject.name,
              style: TextStyle(
                color: ColorManager.blueText,
                fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: .8 * SizeConfig.blockSizeVertical!),
            Text(
              '⭐️ ${topDoctorObject.vote_average} (${topDoctorObject.vote_count} reviews)',
              style: TextStyle(
                fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                color: ColorManager.dark,
              ),
            ),
            SizedBox(height: .8 * SizeConfig.blockSizeVertical!),
            Text(
              'Cardio specialistr - Oran Hospital',
              style: TextStyle(
                fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                color: ColorManager.dark,
              ),
            ),
          ],
        ),
        SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
        cardIconButton(
          imagePath:
              isLiked == false ? '$pngsPath/unlike.png' : '$pngsPath/like.png',
          onTap: () {},
          width: 3 * SizeConfig.blockSizeVertical!,
          height: 3 * SizeConfig.blockSizeVertical!,
        ),
        SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
      ],
    ),
  );
}
