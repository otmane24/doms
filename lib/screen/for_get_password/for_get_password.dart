import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:doms/components/buttons/primary_button.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';
import 'components/contact_detail_item.dart';

class ForGetPassword extends StatelessWidget {
  ForGetPassword({super.key});
  final StateCubit _itemSelected = StateCubit(true);
  bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLanguage.strings.forGetPasswordAppBarText),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          2.4 * SizeConfig.blockSizeVertical!,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<StateCubit, bool>(
              bloc: _itemSelected,
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      AppLanguage.strings.selectCotactForGetPasswordText,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                        color: ColorManager.dark,
                      ),
                    ),
                    SizedBox(
                      height: 2.4 * SizeConfig.blockSizeVertical!,
                    ),
                    contactDetailItem(
                        text: AppLanguage.strings.viaSmsForgetPasswordText,
                        imagePath: '$pngsPath/chat.png',
                        onTap: () {
                          _isSelected = state;
                          _itemSelected.setBlocState(newState: !state);
                        },
                        contact: '+6282******39',
                        isSelected: _isSelected),
                    SizedBox(
                      height: 2.4 * SizeConfig.blockSizeVertical!,
                    ),
                    contactDetailItem(
                        text: AppLanguage.strings.viaEmailForgetPasswordText,
                        imagePath: '$pngsPath/mail.png',
                        onTap: () {
                          _isSelected = state;
                          _itemSelected.setBlocState(newState: !state);
                        },
                        contact: 'ex***le@yourdomain.com',
                        isSelected: !_isSelected),
                  ],
                );
              },
            ),
            primaryButton(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.optCodeRouter);
              },
              text: AppLanguage.strings.continueButton,
            )
          ],
        ),
      ),
    );
  }
}
