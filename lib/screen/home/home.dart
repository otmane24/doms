import 'package:doms/assistant_methode/size_config.dart';
import 'package:doms/constants/objects/constants_objects.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';

import '../../components/text_field/search_text_field.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';
import 'components/bottom_nav_bar.dart';
import 'components/home_app_bar.dart';
import 'components/row_title.dart';
import 'components/special_doctor_item.dart';
import 'components/top_doctor_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => _searchFocusNode.unfocus(),
      child: Scaffold(
        bottomNavigationBar: bottomNavBar(
          context: context,
          selectedIndex: 0,
          onTap: (p0) {
            if (p0 == 1) {
              Navigator.of(context).pushNamed(AppRouter.viewAllDoctorRouter);
            } else if (p0 == 2) {
              Navigator.of(context).pushNamed(AppRouter.viewAllSpecialRouter);
            } else if (p0 == 3) {
              Navigator.of(context).pushNamed(AppRouter.profileRouter);
            }
          },
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.6 * SizeConfig.blockSizeVertical!,
              ),
              child: homeAppBar(context: context),
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.6 * SizeConfig.blockSizeVertical!,
              ),
              child: RichText(
                  text: TextSpan(
                text: AppLanguage.strings.findText,
                style: TextStyle(
                  fontSize: 3.4 * SizeConfig.blockSizeVertical!,
                  color: ColorManager.dark,
                ),
                children: [
                  TextSpan(
                    text: AppLanguage.strings.yourDoctorText,
                    style: TextStyle(
                      fontSize: 3.4 * SizeConfig.blockSizeVertical!,
                      color: ColorManager.greyText,
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.6 * SizeConfig.blockSizeVertical!,
              ),
              child: searchTextField(focusNode: _searchFocusNode),
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.6 * SizeConfig.blockSizeVertical!,
              ),
              child: rowTitleHome(
                  title: AppLanguage.strings.specialDoctorText,
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRouter.viewAllSpecialRouter)),
            ),
            SizedBox(
              height: 2 * SizeConfig.blockSizeVertical!,
            ),
            SizedBox(
              height: 22 * SizeConfig.blockSizeVertical!,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: specialDoctorObjectList.length,
                itemBuilder: (context, i) {
                  return specialDoctorItem(
                    specialDoctorObject: specialDoctorObjectList[i],
                  );
                },
              ),
            ),
            SizedBox(
              height: 2 * SizeConfig.blockSizeVertical!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.6 * SizeConfig.blockSizeVertical!,
              ),
              child: rowTitleHome(
                  title: AppLanguage.strings.topDoctorText,
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRouter.viewAllDoctorRouter)),
            ),
            SizedBox(
              height: 2 * SizeConfig.blockSizeVertical!,
            ),
            SizedBox(
              height: 22 * SizeConfig.blockSizeVertical!,
              child: ListView.separated(
                itemCount: topDoctorObjectList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 2.6 * SizeConfig.blockSizeVertical!,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2 * SizeConfig.blockSizeVertical!,
                  );
                },
                itemBuilder: (context, index) {
                  return doctorItem(
                      onTap: () => Navigator.of(context).pushNamed(
                          AppRouter.detailDoctorRouter,
                          arguments: topDoctorObjectList[index]),
                      topDoctorObject: topDoctorObjectList[index]);
                },
              ),
            ),
            SizedBox(
              height: 2 * SizeConfig.blockSizeVertical!,
            ),
          ],
        ),
      ),
    );
  }
}
