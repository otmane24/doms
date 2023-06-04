import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../businnes_logic/cubit/app_language_cubit.dart';
import '../../../constants/objects/constants_objects.dart';
import '../../../presentation/colors/color_manager.dart';
import '../../../presentation/laungaes/main.dart';

Widget notificationTime(BuildContext context, int index) {
  initializeDateFormatting(context.read<AppLanguageCubit>().state, null);
  String stateTime = '';

  if (DateFormat('MMMM dd yyyy', context.read<AppLanguageCubit>().state)
          .format(notificationObjectList[index].time.toLocal()) ==
      DateFormat('MMMM dd yyyy', context.read<AppLanguageCubit>().state)
          .format(DateTime.now().toLocal())) {
    stateTime = '${AppLanguage.strings.todayText} , ';
  }
  if (DateFormat('MMMM dd yyyy', context.read<AppLanguageCubit>().state)
          .format(notificationObjectList[index].time.toLocal()) ==
      DateFormat('MMMM dd yyyy', context.read<AppLanguageCubit>().state)
          .format(DateTime.now().subtract(const Duration(days: 1)).toLocal())) {
    stateTime = '${AppLanguage.strings.yesterdayText} , ';
  }
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: SizeConfig.blockSizeVertical!,
    ),
    child: Text(
      '$stateTime${DateFormat('MMMM dd yyyy', context.read<AppLanguageCubit>().state).format(notificationObjectList[index].time.toLocal())}',
      style: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
