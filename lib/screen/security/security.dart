import 'package:doms/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/card/setting_item.dart';
import '../../presentation/laungaes/main.dart';

class SecuritySetting extends StatelessWidget {
  SecuritySetting({super.key});
  StateCubit stateCubit = StateCubit(false);
  bool faceId = false;
  bool rememberMe = false;
  bool touchId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.securityAppBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: BlocBuilder<StateCubit, bool>(
          bloc: stateCubit,
          builder: (context, state) {
            return Column(
              children: [
                const Divider(
                  thickness: 1,
                ),
                settingItem(
                  name: AppLanguage.strings.notificationNotificationSettingText,
                  notificationSetting: faceId,
                  onChanged: (value) {
                    faceId = value;
                    stateCubit.setBlocState(newState: !state);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
                settingItem(
                  name: AppLanguage.strings.vibrateNotificationSettingText,
                  notificationSetting: rememberMe,
                  onChanged: (value) {
                    rememberMe = value;
                    stateCubit.setBlocState(newState: !state);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
                settingItem(
                  name:
                      AppLanguage.strings.tipsAvailableNotificationSettingText,
                  notificationSetting: touchId,
                  onChanged: (value) {
                    touchId = value;
                    stateCubit.setBlocState(newState: !state);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
