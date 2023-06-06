import 'package:doms/models/doctor.dart';

import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../constants/strings/constants_strings.dart';
import '../../../presentation/colors/color_manager.dart';

Widget doctorItem(
    {required Doctor doctor, required Function() onTap, double? width}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width,
      padding: EdgeInsets.symmetric(
          vertical: 2 * SizeConfig.blockSizeVertical!,
          horizontal: 2.6 * SizeConfig.blockSizeVertical!),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorManager.borderColor,
            width: 1,
          ),
          color: ColorManager.light),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          doctor.is_online!
              ? Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      height: 7.8 * SizeConfig.blockSizeVertical!,
                      width: 7.8 * SizeConfig.blockSizeVertical!,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.network(
                            doctor.imagePath,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('$pngsPath/avatar.jpg',
                                  fit: BoxFit.cover);
                            },
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )),
                    ),
                    Positioned(
                      right: .6 * SizeConfig.blockSizeVertical!,
                      child: Container(
                        height: 1.5 * SizeConfig.blockSizeVertical!,
                        width: 1.5 * SizeConfig.blockSizeVertical!,
                        decoration: BoxDecoration(
                            color: ColorManager.primaryBlue,
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                      ),
                    )
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  height: 7.8 * SizeConfig.blockSizeVertical!,
                  width: 7.8 * SizeConfig.blockSizeVertical!,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.network(
                        doctor.imagePath,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('$pngsPath/avatar.jpg',
                              fit: BoxFit.cover);
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )),
                ),
          SizedBox(
            height: 2 * SizeConfig.blockSizeVertical!,
          ),
          Text(
            doctor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorManager.darkBlueText,
              fontWeight: FontWeight.w400,
              fontSize: 1.8 * SizeConfig.blockSizeVertical!,
            ),
          ),
          SizedBox(
            height: .8 * SizeConfig.blockSizeVertical!,
          ),
          Text(
            doctor.specialty,
            style: TextStyle(
              color: ColorManager.blueGreyText,
              fontWeight: FontWeight.w500,
              fontSize: 1.4 * SizeConfig.blockSizeVertical!,
            ),
          ),
          SizedBox(
            height: .8 * SizeConfig.blockSizeVertical!,
          ),
          Text(
            '⭐️ 4.5 (${doctor.vote_count > 1000 ? '1k+' : doctor.vote_count} reviews)',
            style: TextStyle(
              color: ColorManager.blueGreyText,
              fontWeight: FontWeight.w500,
              fontSize: 1.2 * SizeConfig.blockSizeVertical!,
            ),
          ),
        ],
      ),
    ),
  );
}
