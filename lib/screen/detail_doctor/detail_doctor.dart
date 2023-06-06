import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/models/doctor.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/routing/app_routing.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/app_language_cubit.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/buttons/card_icon_button.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';
import 'components/card_date_appointment.dart';
import 'components/card_static_doctor.dart';

class DetailDoctor extends StatelessWidget {
  Doctor doctorObject;
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
                vertical: .8 * SizeConfig.blockSizeVertical!,
                horizontal: 1 * SizeConfig.blockSizeVertical!),
            child:
                cardIconButton(imagePath: '$svgsPath/unlike.svg', onTap: () {}),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: .8 * SizeConfig.blockSizeVertical!,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.6 * SizeConfig.blockSizeVertical!,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(
                  doctorObject.imagePath,
                  width: 12 * SizeConfig.blockSizeVertical!,
                  height: 12 * SizeConfig.blockSizeVertical!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('$pngsPath/notfound.jpg',
                        fit: BoxFit.cover);
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
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
                    child: cardStaticDoctor(
                      svgPath: '$svgsPath/patients.svg',
                      value: '1000+',
                      title: AppLanguage.strings.patientStaticDoctorText,
                      color: ColorManager.staticDoctorBackground1,
                    ),
                  ),
                  SizedBox(
                    width: 2.4 * SizeConfig.blockSizeVertical!,
                  ),
                  Expanded(
                    child: cardStaticDoctor(
                      svgPath: '$svgsPath/exprience.svg',
                      value: '10 Yrs',
                      title: AppLanguage.strings.experienceStaticDoctorText,
                      color: ColorManager.staticDoctorBackground2,
                    ),
                  ),
                  SizedBox(
                    width: 2.4 * SizeConfig.blockSizeVertical!,
                  ),
                  Expanded(
                    child: cardStaticDoctor(
                      svgPath: '$svgsPath/ratings.svg',
                      value: '4.5',
                      title: AppLanguage.strings.ratingsStaticDoctorText,
                      color: ColorManager.staticDoctorBackground3,
                    ),
                  ),
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
                  doctorObject.description!,
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
                            date: DateFormat('dd',
                                    context.read<AppLanguageCubit>().state)
                                .format(DateTime.now()
                                    .add(Duration(days: index))
                                    .toLocal()),
                            day: DateFormat('EE',
                                    context.read<AppLanguageCubit>().state)
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
                      onTap: () => Navigator.of(context).pushNamed(
                              AppRouter.appointmentRouter,
                              arguments: [
                                doctorObject,
                                DateTime.parse(selectedDate!)
                              ]),
                      text: AppLanguage.strings.bookAppointmentButton,
                      enable: selectedDate == null);
                },
              ),
              SizedBox(
                height: 2.6 * SizeConfig.blockSizeVertical!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
