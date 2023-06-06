import 'package:doms/businnes_logic/bloc/doctor/doctor_bloc.dart';
import 'package:doms/components/card/row_card_doctor.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/buttons/card_icon_button.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/laungaes/main.dart';
import '../../routing/app_routing.dart';

class ViewAllDoctor extends StatefulWidget {
  const ViewAllDoctor({super.key});

  @override
  State<ViewAllDoctor> createState() => _ViewAllDoctorState();
}

class _ViewAllDoctorState extends State<ViewAllDoctor> {
  String specialtySelected = 'All';

  StateCubit selectedState = StateCubit(false);
  DoctorBloc doctorBloc = DoctorBloc();
  @override
  void initState() {
    doctorBloc.add(const GetDoctor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.light,
      appBar: AppBar(
        backgroundColor: ColorManager.light,
        title: Text(
          AppLanguage.strings.topDoctorAppBarText,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.4 * SizeConfig.blockSizeVertical!),
          SizedBox(
            height: 4.2 * SizeConfig.blockSizeVertical!,
            child: BlocBuilder<StateCubit, bool>(
              bloc: selectedState,
              builder: (context, specialtyState) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.6 * SizeConfig.blockSizeVertical!),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: specialityList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: SizeConfig.blockSizeVertical!);
                  },
                  itemBuilder: (context, index) {
                    return cardSpecialtyItem(
                      name: specialityList[index],
                      isSelected: specialtySelected == specialityList[index],
                      onTap: () {
                        selectedState.setBlocState(newState: !specialtyState);
                        specialtySelected = specialityList[index];
                      },
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 2.4 * SizeConfig.blockSizeVertical!),
          BlocBuilder<DoctorBloc, DoctorState>(
            bloc: doctorBloc,
            builder: (context, state) {
              if (state is DoctorLoading) {
                return Container();
              }
              if (state is DoctorLoaded) {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.4 * SizeConfig.blockSizeVertical!),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.doctors.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                          height: 2.4 * SizeConfig.blockSizeVertical!);
                    },
                    itemBuilder: (context, index) {
                      return rowCardDoctor(
                          onTap: () => Navigator.of(context).pushNamed(
                              AppRouter.detailDoctorRouter,
                              arguments: state.doctors[index]),
                          doctor: state.doctors[index],
                          isLiked: state.doctors[index].is_like);
                    },
                  ),
                );
              }
              if (state is DoctorError) {
                return Container(
                  child: Text(state.message),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget cardSpecialtyItem(
      {required String name,
      required bool isSelected,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: .8 * SizeConfig.blockSizeVertical!,
          horizontal: 2 * SizeConfig.blockSizeVertical!,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: ColorManager.primaryBlue,
          ),
          color: isSelected ? ColorManager.primaryBlue : ColorManager.light,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                color:
                    isSelected ? ColorManager.light : ColorManager.primaryBlue,
                fontSize: 2 * SizeConfig.blockSizeVertical!,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
