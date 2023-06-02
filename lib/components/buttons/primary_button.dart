import 'package:flutter/material.dart';

import '../../presentation/colors/color_manager.dart';

Widget primaryButton(
    {required Function() onTap, required String text, bool enable = false}) {
  return InkWell(
    onTap: enable ? () {} : onTap,
    child: Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            enable
                ? ColorManager.secondaryBlue.withOpacity(.5)
                : ColorManager.secondaryBlue,
            enable
                ? ColorManager.primaryBlue.withOpacity(.5)
                : ColorManager.primaryBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
