import 'package:doms/components/buttons/card_icon_button.dart';
import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/components/buttons/secondary_button.dart';
import 'package:doms/components/text_field/search_text_field.dart';
import 'package:doms/constants/objects/constants_objects.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:doms/screen/home/components/top_doctor_item.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/card/row_card_doctor.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';

class FavoriteDoctor extends StatelessWidget {
  FavoriteDoctor({super.key});
  FocusNode focusNode = FocusNode();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.favoriteDoctorAppBarText,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: .5 * SizeConfig.blockSizeVertical!,
                horizontal: 1.5 * SizeConfig.blockSizeVertical!),
            child:
                cardIconButton(imagePath: '$svgsPath/filtre.svg', onTap: () {}),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 2.6 * SizeConfig.blockSizeVertical!),
        child: Column(
          children: [
            SizedBox(height: 2.4 * SizeConfig.blockSizeVertical!),
            searchTextField(focusNode: focusNode),
            SizedBox(height: 2.4 * SizeConfig.blockSizeVertical!),
            Expanded(
              child: GridView.extent(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisSpacing: 2 * SizeConfig.blockSizeVertical!,
                childAspectRatio: .9,
                maxCrossAxisExtent: 20 * SizeConfig.blockSizeVertical!,
                mainAxisSpacing: 2 * SizeConfig.blockSizeVertical!,
                children: [
                  for (var i = 0; i < topDoctorObjectList.length; i++)
                    Stack(
                      children: [
                        doctorItem(
                            onTap: () => Navigator.of(context).pushNamed(
                                AppRouter.detailDoctorRouter,
                                arguments: topDoctorObjectList[i]),
                            topDoctorObject: topDoctorObjectList[i],
                            width: double.infinity),
                        Positioned(
                            top: SizeConfig.blockSizeVertical!,
                            right: SizeConfig.blockSizeVertical!,
                            child: cardIconButton(
                              imagePath: '$pngsPath/like.png',
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  )),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            topRight: Radius.circular(32),
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.4 *
                                                SizeConfig.blockSizeVertical!,
                                            vertical: 3.6 *
                                                SizeConfig.blockSizeVertical!),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            rowCardDoctor(
                                              topDoctorObject:
                                                  topDoctorObjectList[i],
                                            ),
                                            SizedBox(
                                                height: 3.2 *
                                                    SizeConfig
                                                        .blockSizeVertical!),
                                            Text(
                                              AppLanguage
                                                  .strings.removeFavoriteText,
                                              style: TextStyle(
                                                  fontSize: 1.8 *
                                                      SizeConfig
                                                          .blockSizeVertical!,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.dark),
                                            ),
                                            SizedBox(
                                                height: 3.2 *
                                                    SizeConfig
                                                        .blockSizeVertical!),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: secondaryButton(
                                                      onTap: () {},
                                                      text: AppLanguage.strings
                                                          .cancelButton),
                                                ),
                                                SizedBox(
                                                    width: 2 *
                                                        SizeConfig
                                                            .blockSizeVertical!),
                                                Expanded(
                                                  child: primaryButton(
                                                      onTap: () {},
                                                      text: AppLanguage.strings
                                                          .yesRemoveButton),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                                // scaffoldKey.currentState!
                                //     .showBottomSheet((context) => Container(
                                //           color: Colors.red,
                                //           height: 100,
                                //         ));
                              },
                              width: 3 * SizeConfig.blockSizeVertical!,
                              height: 3 * SizeConfig.blockSizeVertical!,
                            )),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
