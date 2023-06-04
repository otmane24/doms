import 'package:doms/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/cubit/state_cubit.dart';
import '../../components/card/setting_item.dart';
import '../../presentation/laungaes/main.dart';

class AppearanceSetting extends StatelessWidget {
  AppearanceSetting({super.key});
  StateCubit stateCubit = StateCubit(false);
  bool notification = false;
  bool vibrate = false;
  bool tipsAcaialable = false;
  bool serviceAvailble = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.appearanceAppBarText,
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
                  notificationSetting: notification,
                  onChanged: (value) {
                    notification = value;
                    stateCubit.setBlocState(newState: !state);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
                settingItem(
                  name: AppLanguage.strings.vibrateNotificationSettingText,
                  notificationSetting: vibrate,
                  onChanged: (value) {
                    vibrate = value;
                    stateCubit.setBlocState(newState: !state);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
                settingItem(
                  name:
                      AppLanguage.strings.tipsAvailableNotificationSettingText,
                  notificationSetting: tipsAcaialable,
                  onChanged: (value) {
                    tipsAcaialable = value;
                    stateCubit.setBlocState(newState: !state);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
                settingItem(
                  name: AppLanguage
                      .strings.serviceAvailbleNotificationSettingText,
                  notificationSetting: serviceAvailble,
                  onChanged: (value) {
                    serviceAvailble = value;
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
