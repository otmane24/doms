import 'package:flutter/material.dart';

import '../../constants/strings/constants_strings.dart';
import '../../presentation/colors/color_manager.dart';

TextFormField searchTextField({required FocusNode focusNode}) {
  return TextFormField(
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      hintText: 'Search',
    ),
  );
}
