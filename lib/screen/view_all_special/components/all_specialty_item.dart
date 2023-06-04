import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../presentation/colors/color_manager.dart';
import '../../home/components/special_doctor_object.dart';

Widget allSpecialtyItem({required SpecialDoctorObject specialDoctorObject}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      children: [
        Container(
          width: 46.4 * SizeConfig.blockSizeVertical!,
          height: 46.4 * SizeConfig.blockSizeVertical!,
          decoration: BoxDecoration(
            color: specialDoctorObject.colorBackgound,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 4.8 * SizeConfig.blockSizeVertical!,
                height: 4.8 * SizeConfig.blockSizeVertical!,
                child: SvgPicture.asset(specialDoctorObject.imagePath),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!),
              Text(
                '${specialDoctorObject.name} specialist',
                style: TextStyle(
                    color: ColorManager.light,
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: .8 * SizeConfig.blockSizeVertical!),
              Text(
                '${specialDoctorObject.nbrDoctor} Doctors',
                style: TextStyle(
                    color: ColorManager.light.withOpacity(.5),
                    fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Positioned(
          top: -6 * SizeConfig.blockSizeVertical!,
          left: -6 * SizeConfig.blockSizeVertical!,
          child: Container(
            decoration: BoxDecoration(
              color: specialDoctorObject.colorOpacity,
              borderRadius: BorderRadius.circular(90),
            ),
            width: 12 * SizeConfig.blockSizeVertical!,
            height: 12 * SizeConfig.blockSizeVertical!,
          ),
        )
      ],
    ),
  );
}
