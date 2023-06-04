import 'package:doms/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/bottom_sheet/primary_bottom_sheet.dart';
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
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top,
          horizontal: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        children: [
          Container(
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
                cardIconButton(
                    imagePath: '$svgsPath/edit.svg',
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRouter.favoriteDoctorRouter)),
              ],
            ),
          ),
          SizedBox(
            height: 2.4 * SizeConfig.blockSizeVertical!,
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image.asset(
                    '$pngsPath/patientProfil.png',
                    width: 9.8 * SizeConfig.blockSizeVertical!,
                  ),
                  Image.asset(
                    '$pngsPath/edit2.png',
                  ),
                ],
              ),
              SizedBox(
                width: 2.8 * SizeConfig.blockSizeVertical!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wido Studio',
                    style: TextStyle(
                        fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: .4 * SizeConfig.blockSizeVertical!,
                  ),
                  Text(
                    'widostudio@gmail.com',
                    style: TextStyle(
                        color: ColorManager.greyText,
                        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 2.4 * SizeConfig.blockSizeVertical!,
          ),
          profileItem(
              imagePath: '$svgsPath/notification.svg',
              title: AppLanguage.strings.notificationProfileText,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRouter.notificationSettingRouter),
              color: ColorManager.primaryBlue),
          profileItem(
              imagePath: '$svgsPath/scurity.svg',
              title: AppLanguage.strings.securityProfileText,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRouter.securitySettingRouter),
              color: ColorManager.primaryBlue),
          profileItem(
              imagePath: '$svgsPath/appearance.svg',
              title: AppLanguage.strings.appearanceProfileText,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRouter.appearanceSettingRouter),
              color: ColorManager.primaryBlue),
          profileItem(
              imagePath: '$svgsPath/help.svg',
              title: 'Help',
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRouter.helpSettingRouter),
              color: ColorManager.primaryBlue),
          profileItem(
              imagePath: '$svgsPath/invite_freinds.svg',
              title: AppLanguage.strings.invitefriendsProfileText,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRouter.inviteFriendRouter),
              color: ColorManager.primaryBlue),
          profileItem(
              imagePath: '$svgsPath/logout.svg',
              title: AppLanguage.strings.logoutProfileText,
              onTap: () {
                primaryBottomSheet(
                  context: context,
                  body: SvgPicture.asset(
                    '$svgsPath/logout.svg',
                    height: 4.8 * SizeConfig.blockSizeVertical!,
                    color: ColorManager.primaryBlue,
                  ),
                  title: AppLanguage.strings.confirmLogoutText,
                  cancelText: AppLanguage.strings.cancelButton,
                  confrimText: AppLanguage.strings.yesLogoutButton,
                  onCancel: () {},
                  onConfrim: () {},
                );
              },
              color: ColorManager.primaryRed),
        ],
      ),
    );
  }

  Column profileItem({
    required String imagePath,
    required String title,
    required Function() onTap,
    required Color color,
  }) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(1.6 * SizeConfig.blockSizeVertical!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color.withOpacity(.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      width: 5.8 * SizeConfig.blockSizeVertical!,
                      height: 5.8 * SizeConfig.blockSizeVertical!,
                      child: SvgPicture.asset(imagePath),
                    ),
                    SizedBox(
                      width: 2 * SizeConfig.blockSizeVertical!,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color: ColorManager.darkText,
                          fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorManager.primaryBlue,
                  size: 2.8 * SizeConfig.blockSizeVertical!,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
