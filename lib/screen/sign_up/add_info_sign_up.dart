import 'dart:io';

import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:doms/components/alert_dialog/gender_picker.dart';
import 'package:doms/components/alert_dialog/progresse_indicator.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/app_language_cubit.dart';
import '../../components/alert_dialog/image_picker.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/text_field/primary_text_field.dart';
import '../../constants/strings/constants_strings.dart';

class AddInfoSignUp extends StatefulWidget {
  const AddInfoSignUp({super.key});

  @override
  State<AddInfoSignUp> createState() => _AddInfoSignUpState();
}

class _AddInfoSignUpState extends State<AddInfoSignUp> {
  XFile? image;

  String gendreSelected = 'Homme';

  String? brithDaySelected;

  final StateCubit _takePicture = StateCubit(false);

  final StateCubit _selectedGender = StateCubit(false);
  final StateCubit _selectedBrithDay = StateCubit(false);

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController =
      TextEditingController(text: 'Homme');
  final TextEditingController _brithDayController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(context.read<AppLanguageCubit>().state, null);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
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
              primaryTextField(
                  controller: _fullNameController,
                  name: AppLanguage.strings.fullNameTextField),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              BlocBuilder<StateCubit, bool>(
                bloc: _selectedGender,
                builder: (context, stateGender) {
                  print('gendre $gendreSelected');
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
                        controller: _genderController,
                        initialValue: gendreSelected,
                        name: AppLanguage.strings.genderTextField,
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
              BlocBuilder<StateCubit, bool>(
                bloc: _selectedBrithDay,
                builder: (context, state) {
                  return InkWell(
                      onTap: () async {
                        DateTime? daySelected = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (daySelected != null) {
                          brithDaySelected = DateFormat('dd-MM-yyyy',
                                  context.read<AppLanguageCubit>().state)
                              .format(daySelected);
                        }
                        _selectedBrithDay.setBlocState(
                            newState: !_selectedBrithDay.state);
                      },
                      child: primaryTextField(
                        initialValue: brithDaySelected ??
                            DateFormat('dd-MM-yyyy',
                                    context.read<AppLanguageCubit>().state)
                                .format(DateTime.now().toLocal()),
                        controller: _brithDayController,
                        name: AppLanguage.strings.brithDayTextField,
                        enabled: false,
                      ));
                },
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              primaryTextField(
                controller: _addressController,
                name: AppLanguage.strings.addressTextField,
              ),
              SizedBox(
                height: 4.8 * SizeConfig.blockSizeVertical!,
              ),
              primaryButton(
                onTap: () async {
                  showProgresseIndicator(context: context);
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.of(context)
                      .popAndPushNamed(AppRouter.mainScreenRouter);
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
