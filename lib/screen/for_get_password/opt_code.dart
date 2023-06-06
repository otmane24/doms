import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../assistant_methode/ticker.dart';
import '../../businnes_logic/bloc/time/timer_bloc.dart';
import '../../businnes_logic/bloc/time/timer_state.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';
import 'components/pin_code_field.dart';

class OtpCode extends StatelessWidget {
  OtpCode({super.key});
  TimerBloc timerBloc = TimerBloc(ticker: Ticker());
  final StateCubit _onCompleted = StateCubit(true);
  String? codeOtp;
  @override
  Widget build(BuildContext context) {
    timerBloc.add(const TimerStarted(duration: 60));
    return Scaffold(
      backgroundColor: ColorManager.light,
      appBar: AppBar(
        title: Text(AppLanguage.strings.forGetPasswordAppBarText),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.4 * SizeConfig.blockSizeVertical!),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${AppLanguage.strings.codeSendForGetPasswordText} + 213 ********* 4725',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      color: ColorManager.dark,
                    ),
                  ),
                  SizedBox(
                    height: 3 * SizeConfig.blockSizeVertical!,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 1.6 * SizeConfig.blockSizeHorizontal!),
                    child: pinCodeFields(
                        context: context,
                        onCompleted: (code) {
                          codeOtp = code;
                          _onCompleted.setBlocState(newState: false);
                        }),
                  ),
                  SizedBox(
                    height: 3 * SizeConfig.blockSizeVertical!,
                  ),
                  BlocBuilder<TimerBloc, TimerState>(
                    bloc: timerBloc,
                    builder: (context, state) {
                      if (state is TimerRunComplete) {
                        return InkWell(
                          onTap: () {
                            timerBloc.add(const TimerReset());
                            timerBloc.add(const TimerStarted(duration: 60));
                          },
                          child: Text(
                            AppLanguage.strings.reSendAgainForGetPasswordText,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                              color: ColorManager.primaryBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return RichText(
                          text: TextSpan(
                        text: AppLanguage.strings.reSnedForGetPasswordText,
                        style: TextStyle(
                          fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                          color: ColorManager.dark,
                        ),
                        children: [
                          TextSpan(
                            text: timerBloc.state.duration
                                .floor()
                                .toString()
                                .padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                              color: ColorManager.primaryBlue,
                            ),
                          ),
                          TextSpan(
                            text: ' s',
                            style: TextStyle(
                              fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                              color: ColorManager.dark,
                            ),
                          ),
                        ],
                      ));
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<StateCubit, bool>(
              bloc: _onCompleted,
              builder: (context, state) {
                return primaryButton(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(AppRouter.resetPasswordRouter),
                  text: AppLanguage.strings.verifyButton,
                  enable: state,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
