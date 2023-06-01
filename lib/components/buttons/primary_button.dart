import 'package:flutter/material.dart';

import '../../presentation/colors/color_manager.dart';

Widget primaryButton({required Function() onTap, required String text}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorManager.secondaryBlue,
            ColorManager.primaryBlue,
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
