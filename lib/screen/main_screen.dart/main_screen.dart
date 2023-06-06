import 'package:doms/businnes_logic/bloc/doctor/doctor_bloc.dart';
import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/screen/home/home.dart';
import 'package:doms/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/components/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  StateCubit stateScreenCubit = StateCubit(false);

  int currentIndex = 0;

  List<Widget>? screens;

  DoctorBloc doctorBloc = DoctorBloc();

  @override
  void initState() {
    doctorBloc.add(const GetDoctor());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screens = [
      Home(context: context, doctorBloc: doctorBloc),
      Container(
        child: Center(
          child: Text(AppLanguage.strings.appointmentBottomText),
        ),
      ),
      Container(
        child: Center(
          child: Text(AppLanguage.strings.historyBottomText),
        ),
      ),
      profileScreen(context: context),
    ];
    return Scaffold(
      bottomNavigationBar: bottomNavBar(
        context: context,
        selectedIndex: 0,
        onTap: (index) {
          if (index == 0) {
            currentIndex = 0;
            // doctorBloc.add(const GetDoctor());
            stateScreenCubit.setBlocState(newState: !stateScreenCubit.state);
          } else if (index == 1) {
            currentIndex = 1;

            stateScreenCubit.setBlocState(newState: !stateScreenCubit.state);
          } else if (index == 2) {
            currentIndex = 2;

            stateScreenCubit.setBlocState(newState: !stateScreenCubit.state);
          } else if (index == 3) {
            currentIndex = 3;

            stateScreenCubit.setBlocState(newState: !stateScreenCubit.state);
          }
        },
      ),
      body: BlocBuilder<StateCubit, bool>(
        bloc: stateScreenCubit,
        builder: (context, state) {
          return screens![currentIndex];
        },
      ),
    );
  }
}
