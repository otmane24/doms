import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';

Widget obscureTextField({
  required TextEditingController controller,
  required String name,
  TextEditingController? controllerNewPassword,
}) {
  StateCubit visibilityPasswordCubit = StateCubit(true);
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
        bloc: visibilityPasswordCubit,
        builder: (context, isPasswordVisible) {
          return TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLanguage.strings.champValidatorError;
              }
              if (value.isNotEmpty && value.length < 8) {
                return AppLanguage.strings.passwordValidatorError;
              }
              if (name == AppLanguage.strings.confirmPasswordTextField &&
                  controllerNewPassword != null &&
                  value != controllerNewPassword.text) {
                return AppLanguage.strings.confirmePasswordValidatorError;
              }

              return null;
            },
            cursorColor: ColorManager.primaryBlue,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => visibilityPasswordCubit.setBlocState(
                    newState: !isPasswordVisible),
                icon: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: isPasswordVisible
                      ? ColorManager.darkGrey
                      : ColorManager.primaryBlue,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 1.2 * SizeConfig.blockSizeVertical!),
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
