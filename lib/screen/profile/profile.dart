import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/buttons/card_icon_button.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/laungaes/main.dart';
import '../../routing/app_routing.dart';
import '../home/components/bottom_nav_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(
        context: context,
        selectedIndex: 3,
        onTap: (p0) {
          if (p0 == 1) {
            Navigator.of(context).pushNamed(AppRouter.viewAllDoctorRouter);
          } else if (p0 == 2) {
            Navigator.of(context).pushNamed(AppRouter.viewAllSpecialRouter);
          } else if (p0 == 0) {
            Navigator.of(context).pushNamed(AppRouter.homeRouter);
          }
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.6 * SizeConfig.blockSizeVertical!,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 1.2 * SizeConfig.blockSizeVertical!),
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
                        AppLanguage.strings.profileAppBarText,
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
                          imagePath: '$svgsPath/edit.svg',
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.favoriteDoctorRouter)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
