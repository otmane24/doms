import 'package:doms/constants/objects/constants_objects.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/buttons/card_icon_button.dart';
import '../../components/text_field/search_text_field.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';
import 'components/all_specialty_item.dart';

class ViewAllSpecial extends StatelessWidget {
  ViewAllSpecial({super.key});
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.light,
      appBar: AppBar(
        backgroundColor: ColorManager.light,
        title: Text(
          AppLanguage.strings.specialAppBarText,
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
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2 * SizeConfig.blockSizeVertical!,
                    crossAxisSpacing: 2 * SizeConfig.blockSizeVertical!),
                itemCount: specialDoctorObjectList.length,
                itemBuilder: (context, index) {
                  return allSpecialtyItem(
                      specialDoctorObject: specialDoctorObjectList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
