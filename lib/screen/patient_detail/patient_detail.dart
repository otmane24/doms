import 'package:doms/components/alert_dialog/take_appointment.dart';
import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/alert_dialog/gender_picker.dart';
import '../../components/card/selected_item.dart';
import '../../components/text_field/multi_line_text_field.dart';
import '../../components/text_field/primary_text_field.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';
import '../../routing/app_routing.dart';

class PatientDetail extends StatelessWidget {
  PatientDetail({super.key});
  String gendreSelected = 'Homme';
  String? grangeAgeSelected;
  final StateCubit _selectedGender = StateCubit(false);
  final StateCubit _selectedGrangeAge = StateCubit(false);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.detailPatientAppBarText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 2.4 * SizeConfig.blockSizeVertical!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                child: primaryTextField(
                  controller: _fullNameController,
                  name: AppLanguage.strings.fullNameTextField,
                  color: ColorManager.light,
                ),
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                child: Text(
                  AppLanguage.strings.selecteRangeAgeText,
                  style: TextStyle(
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.darkText,
                  ),
                ),
              ),
              SizedBox(
                height: 1.6 * SizeConfig.blockSizeVertical!,
              ),
              SizedBox(
                height: 4.8 * SizeConfig.blockSizeVertical!,
                child: BlocBuilder<StateCubit, bool>(
                  bloc: _selectedGrangeAge,
                  builder: (context, rangeAgeState) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return selectedItem(
                              onTap: () {
                                _selectedGrangeAge.setBlocState(
                                    newState: !rangeAgeState);
                                grangeAgeSelected = rangeAgeList[index];
                              },
                              text: rangeAgeList[index],
                              isSelected:
                                  grangeAgeSelected == rangeAgeList[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 1.2 * SizeConfig.blockSizeVertical!,
                          );
                        },
                        itemCount: rangeAgeList.length);
                  },
                ),
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                child: primaryTextField(
                  controller: _phoneController,
                  name: AppLanguage.strings.phoneTextField,
                  color: ColorManager.light,
                ),
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                child: BlocBuilder<StateCubit, bool>(
                  bloc: _selectedGender,
                  builder: (context, stateGender) {
                    return InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
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
                          color: ColorManager.light,
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
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                child: multiLineTextField(
                    controller: _problemController,
                    name: AppLanguage.strings.whatWrongTextField,
                    color: ColorManager.light),
              ),
              SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                child: primaryButton(
                    onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return showTakeAppointmentDialog(
                                context: context,
                                imagePath: '$pngsPath/wchat.png',
                                massage:
                                    AppLanguage.strings.confirmAppointmentText,
                                title:
                                    AppLanguage.strings.valideAppointmentText,
                                textButton: AppLanguage.strings.backHomeButton,
                                isError: false,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRouter.mainScreenRouter,
                                      (route) => false);
                                });
                          },
                        ),
                    text: AppLanguage.strings.nextButton),
              )
            ],
          ),
        ),
      ),
    );
  }
}
