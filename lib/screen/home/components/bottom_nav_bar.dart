import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../constants/strings/constants_strings.dart';
import '../../../presentation/colors/color_manager.dart';

Widget bottomNavBar(
    {required BuildContext context,
    required int selectedIndex,
    required Function(int) onTap}) {
  return Container(
    // height: 8 * SizeConfig.blockSizeVertical!,

    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: ColorManager.light,
      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          color: Colors.black.withOpacity(.1),
        )
      ],
    ),
    child: GNav(
        selectedIndex: selectedIndex,
        textSize: 14,
        onTabChange: onTap,
        style: GnavStyle.google,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        rippleColor: ColorManager.primaryBlue,
        hoverColor: ColorManager.primaryBlue.withOpacity(.2),
        haptic: true,
        tabBorderRadius: 12,
        tabMargin: EdgeInsets.all(1.6 * SizeConfig.blockSizeVertical!),
        backgroundColor: ColorManager.light,
        tabShadow: [
          BoxShadow(
              color: ColorManager.primaryBlue.withOpacity(0.1), blurRadius: 1)
        ],
        curve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 300),
        gap: 1.6 * SizeConfig.blockSizeVertical!,
        color: ColorManager.primaryBlue,
        activeColor: ColorManager.primaryBlue,
        iconSize: 24,
        tabBackgroundColor: ColorManager.primaryBlue.withOpacity(0.1),
        padding: EdgeInsets.symmetric(
          horizontal: 1.6 * SizeConfig.blockSizeVertical!,
          vertical: .8 * SizeConfig.blockSizeVertical!,
        ),
        tabs: [
          GButton(
            leading: Image.asset('$pngsPath/home.png'),
            icon: Icons.javascript_rounded,
            text: 'Home',
          ),
          GButton(
            icon: Icons.javascript_rounded,
            leading: Image.asset('$pngsPath/barnav1.png'),
            text: 'Likes',
          ),
          GButton(
            icon: Icons.search,
            leading: Image.asset('$pngsPath/barnav2.png'),
            text: 'Search',
          ),
          GButton(
            leading: Image.asset('$pngsPath/barnav3.png'),
            icon: Icons.propane,
            text: 'Profile',
          )
        ]),
  );
}
