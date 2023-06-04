import 'package:doms/screen/home/components/special_doctor_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assistant_methode/size_config.dart';

Widget specialDoctorItem({required SpecialDoctorObject specialDoctorObject}) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Container(
              width: 6.4 * SizeConfig.blockSizeVertical!,
              height: 6.4 * SizeConfig.blockSizeVertical!,
              decoration: BoxDecoration(
                color: specialDoctorObject.colorBackgound,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(2 * SizeConfig.blockSizeVertical!),
              child: SvgPicture.asset(specialDoctorObject.imagePath),
            ),
            Positioned(
              top: -2.1 * SizeConfig.blockSizeVertical!,
              left: -2.1 * SizeConfig.blockSizeVertical!,
              child: Container(
                decoration: BoxDecoration(
                  color: specialDoctorObject.colorOpacity,
                  borderRadius: BorderRadius.circular(90),
                ),
                width: 4.2 * SizeConfig.blockSizeVertical!,
                height: 4.2 * SizeConfig.blockSizeVertical!,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 1 * SizeConfig.blockSizeVertical!,
      ),
      Text(
        specialDoctorObject.name,
        style: TextStyle(
          fontSize: 1.2 * SizeConfig.blockSizeVertical!,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  );
}
