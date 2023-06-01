import 'package:flutter/material.dart';

Future showFadeCenterDialog(
    {required BuildContext context,
    String? barrierLabel,
    required Widget pageBody}) {
  return showGeneralDialog(
      context: context,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierLabel != null,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) => pageBody,
      transitionBuilder: (context, anim1, anim2, child) => FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(anim1), child: child));
}
