import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';

TextFormField searchTextField(
    {required FocusNode focusNode, required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      filled: true,
      fillColor: ColorManager.textFieldBackgound,
      suffixIcon: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset('$pngsPath/search.png'),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 24, vertical: 1.2 * SizeConfig.blockSizeVertical!),
      hintText: 'Search',
    ),
  );
}
