import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';

showImagePickerDialog({
  required BuildContext context,
  required Function(XFile) onTapCamera,
  required Function(XFile) onTapGalerie,
}) {
  return AlertDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
    backgroundColor: ColorManager.light,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 1.6 * SizeConfig.blockSizeVertical!,
        ),
        Center(
          child: Text(
            AppLanguage.strings.choseActionAlertText,
            style: TextStyle(
              fontSize: 1.8 * SizeConfig.blockSizeVertical!,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            thickness: 1,
            color: ColorManager.darkGrey,
          ),
        ),
        SizedBox(
          height: .8 * SizeConfig.blockSizeVertical!,
        ),
        InkWell(
          onTap: () async {
            Navigator.of(context).pop();
            await ImagePicker()
                .pickImage(
              source: ImageSource.camera,
            )
                .then((value) {
              onTapCamera(value!);
            });
          },
          child: Container(
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorManager.light,
                border: Border.all(color: ColorManager.primaryBlue),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x29000000),
                    offset: Offset(1, 2),
                  )
                ]),
            child: Center(
              child: Text(
                AppLanguage.strings.cameraAlertText,
                style: TextStyle(
                  fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await ImagePicker()
                  .pickImage(
                source: ImageSource.gallery,
              )
                  .then((value) {
                onTapGalerie(value!);
              });
            },
            child: Container(
                width: double.infinity,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorManager.light,
                    border: Border.all(color: ColorManager.primaryBlue),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x29000000),
                        offset: Offset(1, 2),
                      )
                    ]),
                child: Center(
                    child: Text(
                  AppLanguage.strings.galerieAlertText,
                  style: TextStyle(
                    fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w500,
                  ),
                )))),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
  );
}
