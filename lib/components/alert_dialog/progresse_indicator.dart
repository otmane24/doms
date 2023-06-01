import 'package:doms/components/alert_dialog/show_alert_dialog.dart';
import 'package:flutter/material.dart';

import '../../presentation/colors/color_manager.dart';

showProgresseIndicator({required BuildContext context, String? title}) async {
  return await showFadeCenterDialog(
      context: context,
      pageBody: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 140,
                height: 140,
                padding: const EdgeInsets.all(38),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 4,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorManager.primaryBlue),
                ),
              ),
            ],
          )));
}
