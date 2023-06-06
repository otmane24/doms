import 'package:doms/constants/objects/constants_objects.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/models/doctor.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:doms/screen/appointment/components/fee_information_object.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/app_language_cubit.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/buttons/selected_buttom.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';
import 'components/fee_information_card.dart';

class Appointment extends StatefulWidget {
  Doctor doctorObject;
  DateTime dateSelected;
  Appointment(
      {required this.doctorObject, required this.dateSelected, super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  StateCubit momentStateCubit = StateCubit(false);

  StateCubit timnStateCubit = StateCubit(false);

  StateCubit feeInformationStateCubit = StateCubit(false);

  String? momentSelected;

  String? timeSelected;

  FeeInformationObject? feeInformationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.bookAppointmentAppBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.4 * SizeConfig.blockSizeVertical!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE,MMMM dd yyyy',
                          context.read<AppLanguageCubit>().state)
                      .format(widget.dateSelected.toLocal()),
                  style: TextStyle(
                      color: ColorManager.darkText,
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.6 * SizeConfig.blockSizeVertical!,
                ),
                Row(
                  children: [
                    Expanded(
                      child: selectedButton(
                          enable: true,
                          onTap: () {
                            setState(() {
                              momentSelected = AppLanguage.strings.morningText;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '$pngsPath/sunny.png',
                                color: momentSelected ==
                                        AppLanguage.strings.morningText
                                    ? ColorManager.light
                                    : ColorManager.primaryBlue,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeVertical!,
                              ),
                              Text(
                                AppLanguage.strings.morningText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: momentSelected ==
                                          AppLanguage.strings.morningText
                                      ? ColorManager.light
                                      : ColorManager.primaryBlue,
                                  fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          selected: momentSelected ==
                              AppLanguage.strings.morningText),
                    ),
                    SizedBox(
                      width: 1.6 * SizeConfig.blockSizeVertical!,
                    ),
                    Expanded(
                      child: selectedButton(
                          enable: true,
                          onTap: () {
                            setState(() {
                              momentSelected = AppLanguage.strings.eveningText;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '$pngsPath/incandescent.png',
                                color: momentSelected ==
                                        AppLanguage.strings.eveningText
                                    ? ColorManager.light
                                    : ColorManager.primaryBlue,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeVertical!,
                              ),
                              Text(
                                AppLanguage.strings.eveningText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: momentSelected ==
                                          AppLanguage.strings.eveningText
                                      ? ColorManager.light
                                      : ColorManager.primaryBlue,
                                  fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          selected: momentSelected ==
                              AppLanguage.strings.eveningText),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.4 * SizeConfig.blockSizeVertical!,
                ),
                Text(
                  AppLanguage.strings.chooseHourText,
                  style: TextStyle(
                      color: ColorManager.darkText,
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.6 * SizeConfig.blockSizeVertical!,
                ),
                BlocBuilder<StateCubit, bool>(
                  bloc: timnStateCubit,
                  builder: (context, timestate) {
                    return SizedBox(
                      height: 5.4 * SizeConfig.blockSizeVertical!,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          crossAxisSpacing: 1.6 * SizeConfig.blockSizeVertical!,
                          mainAxisSpacing: 1.6 * SizeConfig.blockSizeVertical!,
                        ),
                        itemBuilder: (context, index) {
                          return selectedButton(
                            enable: momentSelected !=
                                AppLanguage.strings.eveningText,
                            onTap: momentSelected ==
                                    AppLanguage.strings.eveningText
                                ? () {}
                                : () {
                                    timeSelected = timeList[index];
                                    timnStateCubit.setBlocState(
                                        newState: !timestate);
                                  },
                            child: Center(
                              child: Text(
                                '${index + 9}:00 AM',
                                style: TextStyle(
                                  color: timeSelected == timeList[index]
                                      ? ColorManager.light
                                      : momentSelected ==
                                              AppLanguage.strings.eveningText
                                          ? ColorManager.primaryBlue
                                              .withOpacity(.5)
                                          : ColorManager.primaryBlue,
                                  fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            selected: timeSelected == timeList[index],
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 1.2 * SizeConfig.blockSizeVertical!,
                ),
                BlocBuilder<StateCubit, bool>(
                  bloc: timnStateCubit,
                  builder: (context, timestate) {
                    return SizedBox(
                      height: 12.5 * SizeConfig.blockSizeVertical!,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          crossAxisSpacing: 1.6 * SizeConfig.blockSizeVertical!,
                          mainAxisSpacing: 1.6 * SizeConfig.blockSizeVertical!,
                        ),
                        itemBuilder: (context, index) {
                          return selectedButton(
                            enable: momentSelected ==
                                AppLanguage.strings.eveningText,
                            onTap: momentSelected !=
                                    AppLanguage.strings.eveningText
                                ? () {}
                                : () {
                                    timeSelected = timeList[index + 3];
                                    timnStateCubit.setBlocState(
                                        newState: !timestate);
                                  },
                            child: Center(
                              child: Text(
                                '${index + 13}:00 PM',
                                style: TextStyle(
                                  color: timeSelected == timeList[index + 3]
                                      ? ColorManager.light
                                      : momentSelected !=
                                              AppLanguage.strings.eveningText
                                          ? ColorManager.primaryBlue
                                              .withOpacity(.5)
                                          : ColorManager.primaryBlue,
                                  fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            selected: timeSelected == timeList[index + 3],
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.4 * SizeConfig.blockSizeVertical!,
                ),
                Text(
                  AppLanguage.strings.feeInformationText,
                  style: TextStyle(
                      color: ColorManager.darkText,
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.6 * SizeConfig.blockSizeVertical!,
                ),
                BlocBuilder<StateCubit, bool>(
                  bloc: feeInformationStateCubit,
                  builder: (context, state) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return feeInformationCard(
                              onTap: () {
                                feeInformationSelected =
                                    feeInfomationObjectList[index];
                                feeInformationStateCubit.setBlocState(
                                    newState: !state);
                              },
                              feeInformation: feeInfomationObjectList[index],
                              isSelected: feeInformationSelected ==
                                  feeInfomationObjectList[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.6 * SizeConfig.blockSizeVertical!,
                          );
                        },
                        itemCount: feeInfomationObjectList.length);
                  },
                )
              ],
            ),
            BlocBuilder<StateCubit, bool>(
              bloc: momentStateCubit,
              builder: (context, state) {
                return BlocBuilder<StateCubit, bool>(
                  bloc: timnStateCubit,
                  builder: (context, state) {
                    return BlocBuilder<StateCubit, bool>(
                      bloc: feeInformationStateCubit,
                      builder: (context, state) {
                        return primaryButton(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.patientDetailRouter),
                          text: AppLanguage.strings.nextButton,
                          enable: !(feeInformationSelected != null &&
                              timeSelected != null &&
                              momentSelected != null),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
