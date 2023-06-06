import 'package:doms/models/doctor.dart';

import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';
import '../buttons/card_icon_button.dart';

Widget rowCardDoctor(
    {required Doctor doctor, required Function() onTap, bool? isLiked}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.borderColor,
        ),
        color: ColorManager.light,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                    child: Image.network(
                      doctor.imagePath,
                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
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
              SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      color: ColorManager.blueText,
                      fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: .8 * SizeConfig.blockSizeVertical!),
                  Text(
                    '⭐️ 4.5 (${doctor.vote_count > 1000 ? '1k+' : doctor.vote_count} reviews)',
                    style: TextStyle(
                      fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                      color: ColorManager.dark,
                    ),
                  ),
                  SizedBox(height: .8 * SizeConfig.blockSizeVertical!),
                  Text(
                    doctor.address!,
                    style: TextStyle(
                      fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                      color: ColorManager.dark,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
            ],
          ),
          Row(
            children: [
              cardIconButton(
                imagePath: isLiked == false
                    ? '$svgsPath/unlike.svg'
                    : '$svgsPath/like.svg',
                onTap: () {},
                width: 3 * SizeConfig.blockSizeVertical!,
                height: 3 * SizeConfig.blockSizeVertical!,
              ),
              SizedBox(width: 2 * SizeConfig.blockSizeVertical!),
            ],
          )
        ],
      ),
    ),
  );
}
