import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../presentation/colors/color_manager.dart';

Widget pinCodeFields({
  required BuildContext context,
  required Function(String) onCompleted,
}) {
  return PinCodeTextField(
    appContext: context,
    autoFocus: false,
    cursorColor: ColorManager.primaryBlue,
    keyboardType: TextInputType.number,
    length: 4,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    boxShadows: const [
      BoxShadow(
        color: Color(0x09000000),
        blurRadius: 4,
        offset: Offset(1, 2), // Shadow position
      ),
    ],
    obscureText: false,
    animationType: AnimationType.scale,
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(20),
      fieldHeight: 84,
      fieldWidth: 80,
      errorBorderColor: ColorManager.redError,
      activeColor: ColorManager.primaryBlue,
      inactiveColor: ColorManager.borderColor2,
      inactiveFillColor: Colors.white,
      activeFillColor: Colors.white,
      selectedColor: ColorManager.primaryBlue,
      selectedFillColor: Colors.white,
      borderWidth: 1,
    ),
    textStyle: const TextStyle(fontSize: 24),
    animationDuration: const Duration(milliseconds: 300),
    backgroundColor: ColorManager.light,
    enableActiveFill: true,
    onCompleted: onCompleted,
    onChanged: (value) {},
    beforeTextPaste: (text) {
      return true;
    },
  );
}
