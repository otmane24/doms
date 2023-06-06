import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../presentation/colors/color_manager.dart';

Widget primaryTextField(
    {TextEditingController? controller,
    required String name,
    String? initialValue,
    bool? enabled,
    Color? color,
    Widget? suffixIcon}) {
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
      TextFormField(
        enabled: enabled,
        cursorColor: ColorManager.primaryBlue,
        decoration: InputDecoration(
          fillColor: color,
          filled: color != null,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 1.2 * SizeConfig.blockSizeVertical!),
          hintText: initialValue ?? name,
          hintStyle: TextStyle(
              color: initialValue != null
                  ? ColorManager.darkText
                  : ColorManager.hintText),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primaryBlue, width: 1),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    ],
  );
}
