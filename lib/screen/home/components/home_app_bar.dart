import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../components/buttons/card_icon_button.dart';
import '../../../constants/strings/constants_strings.dart';
import '../../../presentation/laungaes/main.dart';

Widget homeAppBar({required BuildContext context}) {
  return Container(
    padding:
        EdgeInsets.symmetric(vertical: 1.2 * SizeConfig.blockSizeVertical!),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              '$pngsPath/logo.png',
              width: 3.5 * SizeConfig.blockSizeVertical!,
              height: 3.5 * SizeConfig.blockSizeVertical!,
            ),
            SizedBox(
              width: 2 * SizeConfig.blockSizeVertical!,
            ),
            Text(
              AppLanguage.strings.homeAppBarText,
              style: TextStyle(
                  fontSize: 2.4 * SizeConfig.blockSizeVertical!,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            cardIconButton(
                imagePath: '$svgsPath/notification.svg',
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRouter.notificationRouter)),
            SizedBox(
              width: 1.6 * SizeConfig.blockSizeVertical!,
            ),
            cardIconButton(
                imagePath: '$svgsPath/like.svg',
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRouter.favoriteDoctorRouter)),
          ],
        ),
      ],
    ),
  );
}
