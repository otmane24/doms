import 'package:doms/assistant_methode/hivebase.dart';
import 'package:doms/constants/objects/constants_objects.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:doms/screen/boarding/components/slider_objects.dart';
import 'package:flutter/material.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/buttons/secondary_button.dart';
import '../../../presentation/colors/color_manager.dart';
import 'indicateur_page.dart';

Widget pageViewItem(
    {required BuildContext context,
    required SliderObjet sliderObjet,
    required int currentPage}) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 55 * SizeConfig.blockSizeVertical!,
            width: double.infinity,
            color: sliderObjet.backgroundColor,
          ),
          Image.asset(
            sliderObjet.image,
            fit: BoxFit.fill,
          ),
        ],
      ),
      Container(
        height: 45 * SizeConfig.blockSizeVertical!,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10 * SizeConfig.blockSizeHorizontal!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    sliderObjet.title,
                    style: TextStyle(
                      fontSize: 2.4 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.primaryBlue,
                    ),
                  ),
                  SizedBox(
                    height: 1.8 * SizeConfig.blockSizeVertical!,
                  ),
                  Text(
                    sliderObjet.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      color: ColorManager.dark,
                    ),
                  ),
                  SizedBox(
                    height: 1.8 * SizeConfig.blockSizeVertical!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < sliderObjetList.length; i++)
                        indicateurPage(isCurrentPage: currentPage == i),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  secondaryButton(
                      onTap: () async {
                        await HiveBase.hiveBase.setOnBoadringShow(true);
                        Navigator.pushNamed(context, AppRouter.authRouter);
                      },
                      text: AppLanguage.strings.skipButton),
                  SizedBox(
                    height: 3.2 * SizeConfig.blockSizeVertical!,
                  ),
                  primaryButton(
                      onTap: () async {
                        await HiveBase.hiveBase.setOnBoadringShow(true);

                        Navigator.pushNamed(context, AppRouter.signUpRouter);
                      },
                      text: AppLanguage.strings.signUpButton),
                  SizedBox(
                    height: 2.4 * SizeConfig.blockSizeVertical!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
