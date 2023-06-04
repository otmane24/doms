import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:doms/screen/home/components/top_doctor_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/app_language_cubit.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/buttons/card_icon_button.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';

class DetailDoctor extends StatelessWidget {
  DoctorObject doctorObject;
  DetailDoctor({required this.doctorObject, super.key});

  String? selectedDate;
  StateCubit selecteState = StateCubit(false);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(context.read<AppLanguageCubit>().state, null);
    return Scaffold(
      backgroundColor: ColorManager.lightGreyBackgound,
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          doctorObject.name,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: .5 * SizeConfig.blockSizeVertical!,
                horizontal: 1 * SizeConfig.blockSizeVertical!),
            child:
                cardIconButton(imagePath: '$svgsPath/unlike.svg', onTap: () {}),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: .5 * SizeConfig.blockSizeVertical!,
                horizontal: 1 * SizeConfig.blockSizeVertical!),
            child: cardIconButton(
                imagePath: '$svgsPath/share.svg',
                onTap: () {
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                }),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3 * SizeConfig.blockSizeVertical!,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2.6 * SizeConfig.blockSizeVertical!,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                doctorObject.imagePath,
                width: 12 * SizeConfig.blockSizeVertical!,
                height: 12 * SizeConfig.blockSizeVertical!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 2.6 * SizeConfig.blockSizeVertical!,
            ),
            Text(
              doctorObject.name,
              style: TextStyle(
                  fontSize: 2.2 * SizeConfig.blockSizeVertical!,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.darkBlueText),
            ),
            SizedBox(
              height: 1.4 * SizeConfig.blockSizeVertical!,
            ),
            Text(
              doctorObject.specialty,
              style: TextStyle(
                color: ColorManager.blueGreyText,
                fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2.6 * SizeConfig.blockSizeVertical!,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: ColorManager.light,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color(0x207AEBFA),
                          ),
                          height: 6.4 * SizeConfig.blockSizeVertical!,
                          width: 5 * SizeConfig.blockSizeVertical!,
                          child: SvgPicture.asset(
                            '$svgsPath/patients.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          '1000+',
                          style: TextStyle(
                              fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.darkBlueText),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          'Patients',
                          style: TextStyle(
                            color: ColorManager.blueGreyText,
                            fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.4 * SizeConfig.blockSizeVertical!,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: ColorManager.light,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color(0x20E8899E),
                          ),
                          height: 6.4 * SizeConfig.blockSizeVertical!,
                          width: 5 * SizeConfig.blockSizeVertical!,
                          child: SvgPicture.asset(
                            '$svgsPath/exprience.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          '10 Yrs',
                          style: TextStyle(
                              fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.darkBlueText),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          'Experience',
                          style: TextStyle(
                            color: ColorManager.blueGreyText,
                            fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.4 * SizeConfig.blockSizeVertical!,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: ColorManager.light,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color(0x20F7C480),
                          ),
                          height: 6.4 * SizeConfig.blockSizeVertical!,
                          width: 5 * SizeConfig.blockSizeVertical!,
                          child: SvgPicture.asset(
                            '$svgsPath/ratings.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontSize: 1.8 * SizeConfig.blockSizeVertical!,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.darkBlueText),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical!,
                        ),
                        Text(
                          'Ratings',
                          style: TextStyle(
                            color: ColorManager.blueGreyText,
                            fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Doctor',
                style: TextStyle(
                    fontSize: 2 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.darkBlueText),
              ),
            ),
            SizedBox(
              height: 1.2 * SizeConfig.blockSizeVertical!,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dr. Bellamy Nicholas is a top specialist at London Bridge Hospital at London. He has achieved several awards and recognition for is contribution and service in his own field. He is available for private consultation. ',
                style: TextStyle(
                    height: 1.4,
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.blueGreyText),
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Working time',
                style: TextStyle(
                    fontSize: 2 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.darkBlueText),
              ),
            ),
            SizedBox(
              height: 1.2 * SizeConfig.blockSizeVertical!,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mon - Sat (08:30 AM - 09:00 PM)',
                style: TextStyle(
                    fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.blueGreyText),
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            SizedBox(
              height: 12 * SizeConfig.blockSizeVertical!,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 1.4 * SizeConfig.blockSizeVertical!,
                  );
                },
                itemCount: 30,
                itemBuilder: (context, index) {
                  return BlocBuilder<StateCubit, bool>(
                    bloc: selecteState,
                    builder: (context, state) {
                      return cardDateAppointement(
                          onTap: () {
                            selectedDate = DateFormat('yyyy-MM-dd',
                                    context.read<AppLanguageCubit>().state)
                                .format(DateTime.now()
                                    .add(Duration(days: index))
                                    .toLocal());
                            selecteState.setBlocState(newState: !state);
                          },
                          date: DateFormat(
                                  'dd', context.read<AppLanguageCubit>().state)
                              .format(DateTime.now()
                                  .add(Duration(days: index))
                                  .toLocal()),
                          day: DateFormat(
                                  'EE', context.read<AppLanguageCubit>().state)
                              .format(DateTime.now()
                                  .add(Duration(days: index))
                                  .toLocal()),
                          selected: selectedDate ==
                              DateFormat('yyyy-MM-dd',
                                      context.read<AppLanguageCubit>().state)
                                  .format(DateTime.now()
                                      .add(Duration(days: index))
                                      .toLocal()));
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.blockSizeVertical!,
            ),
            BlocBuilder<StateCubit, bool>(
              bloc: selecteState,
              builder: (context, state) {
                return primaryButton(
                    onTap: () => Navigator.of(context)
                            .pushNamed(AppRouter.appointmentRouter, arguments: [
                          doctorObject,
                          DateTime.parse(selectedDate!)
                        ]),
                    text: AppLanguage.strings.bookAppointmentButton,
                    enable: selectedDate == null);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardDateAppointement({
    required String date,
    required String day,
    required Function() onTap,
    required bool selected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.6 * SizeConfig.blockSizeVertical!,
          horizontal: 3 * SizeConfig.blockSizeVertical!,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: selected
              ? ColorManager.primaryBlue
              : ColorManager.lightGreyBackgound,
          border: selected
              ? Border.all(
                  color: ColorManager.primaryBlue,
                )
              : Border.all(
                  color: ColorManager.borderColor,
                ),
        ),
        child: Column(
          children: [
            Text(
              date,
              style: TextStyle(
                  fontSize: 2.4 * SizeConfig.blockSizeVertical!,
                  fontWeight: FontWeight.bold,
                  color: selected
                      ? ColorManager.light
                      : ColorManager.blueGreyText),
            ),
            SizedBox(
              height: 1.4 * SizeConfig.blockSizeVertical!,
            ),
            Text(
              day,
              style: TextStyle(
                fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.bold,
                color:
                    selected ? ColorManager.light : ColorManager.blueGreyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
