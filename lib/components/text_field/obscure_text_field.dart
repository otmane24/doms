import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

StateCubit _visibilityPasswordCubit = StateCubit(true);
Widget obscureTextField({required String name}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 1.6 * SizeConfig.blockSizeVertical!,
            fontWeight: FontWeight.w400,
            color: ColorManager.darkText,
          ),
        ),
      ),
      SizedBox(
        height: 1.2 * SizeConfig.blockSizeVertical!,
      ),
      BlocBuilder<StateCubit, bool>(
        bloc: _visibilityPasswordCubit,
        builder: (context, isPasswordVisible) {
          return TextFormField(
            cursorColor: ColorManager.primaryBlue,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => _visibilityPasswordCubit.setBlocState(
                    newState: !isPasswordVisible),
                icon: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: isPasswordVisible
                      ? ColorManager.darkGrey
                      : ColorManager.primaryBlue,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              hintText: name,
              hintStyle: TextStyle(color: ColorManager.hintText),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.primaryBlue, width: 1),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          );
        },
      ),
    ],
  );
}
