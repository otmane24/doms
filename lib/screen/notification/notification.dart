import 'package:doms/constants/objects/constants_objects.dart';
import 'package:doms/presentation/laungaes/main.dart';
import 'package:doms/screen/notification/components/notification_item.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import 'components/notification_time.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLanguage.strings.notificationAppBarText,
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.blockSizeVertical!,
            vertical: SizeConfig.blockSizeVertical!),
        itemCount: notificationObjectList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                notificationTime(context, index),
                notificationItem(
                    notificationObject: notificationObjectList[index])
              ],
            );
          } else {
            if (notificationObjectList[index].time !=
                notificationObjectList[index - 1].time) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  notificationTime(context, index),
                  notificationItem(
                      notificationObject: notificationObjectList[index])
                ],
              );
            } else {
              return notificationItem(
                  notificationObject: notificationObjectList[index]);
            }
          }
        },
      ),
    );
  }
}
