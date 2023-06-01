import 'dart:io';

import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:doms/components/alert_dialog/gender_picker.dart';
import 'package:doms/components/alert_dialog/progresse_indicator.dart';
import 'package:doms/components/text_field/primary_text_field.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/alert_dialog/image_picker.dart';
import '../../components/buttons/primary_button.dart';
import '../../constants/strings/constants_strings.dart';

class AddInfoSignUp extends StatefulWidget {
  const AddInfoSignUp({super.key});

  @override
  State<AddInfoSignUp> createState() => _AddInfoSignUpState();
}

class _AddInfoSignUpState extends State<AddInfoSignUp> {
  XFile? image;

  String gendreSelected = 'Homme';

  final StateCubit _takePicture = StateCubit(false);

  final StateCubit _selectedGender = StateCubit(false);

  @override
  void initState() {
    // TODOgenderController =

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLanguage.strings.profileDetailsAppBarText),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.top,
            horizontal: 3 * SizeConfig.blockSizeVertical!,
          ),
          child: Column(
            children: [
              BlocBuilder<StateCubit, bool>(
                bloc: _takePicture,
                builder: (context, takePicture) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return showImagePickerDialog(
                                context: context,
                                onTapCamera: (img) {
                                  _takePicture.setBlocState(
                                      newState: !takePicture);
                                  image = img;
                                },
                                onTapGalerie: (img) {
                                  image = img;
                                  _takePicture.setBlocState(
                                      newState: !takePicture);
                                });
                          });
                    },
                    child: Container(
                      padding: image == null
                          ? EdgeInsets.all(2.6 * SizeConfig.blockSizeVertical!)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color: ColorManager.lightGreyBackgound,
                          borderRadius: BorderRadius.circular(90),
                          border: image == null
                              ? Border.all(
                                  color: ColorManager.borderColor,
                                  width: 4,
                                )
                              : null),
                      constraints: const BoxConstraints(
                        maxWidth: 110,
                        maxHeight: 110,
                      ),
                      width: 11 * SizeConfig.blockSizeVertical!,
                      height: 11 * SizeConfig.blockSizeVertical!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: image != null
                            ? Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.asset(
                                '$svgsPath/account.svg',
                              ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              primaryTextField(name: 'Full Name'),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              BlocBuilder<StateCubit, bool>(
                bloc: _selectedGender,
                builder: (context, stateGender) {
                  return InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return showGenderPickerDialog(
                              context: context,
                              onTap: (gendre) {
                                gendreSelected = gendre;
                                _selectedGender.setBlocState(
                                    newState: !stateGender);
                              },
                            );
                          });
                    },
                    child: primaryTextField(
                        name: 'Gender',
                        enabled: false,
                        suffixIcon: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return showGenderPickerDialog(
                                      context: context,
                                      onTap: (gendre) {
                                        gendreSelected = gendre;

                                        _selectedGender.setBlocState(
                                            newState: !stateGender);
                                      },
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ))),
                  );
                },
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              InkWell(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now());
                  },
                  child:
                      primaryTextField(name: 'Date of Birth', enabled: false)),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              primaryTextField(name: 'Address'),
              SizedBox(
                height: 4.8 * SizeConfig.blockSizeVertical!,
              ),
              primaryButton(
                onTap: () {
                  showProgresseIndicator(context: context);
                },
                text: AppLanguage.strings.nextButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
