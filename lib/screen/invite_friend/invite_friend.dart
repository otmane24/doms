import 'package:doms/assistant_methode/size_config.dart';
import 'package:doms/constants/objects/constants_objects.dart';
import 'package:doms/screen/invite_friend/components/friend_object.dart';
import 'package:flutter/material.dart';

import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';

class InviteFriend extends StatelessWidget {
  const InviteFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.lightGreyBackgound,
          title: Text(AppLanguage.strings.inviteFriendAppBarText),
        ),
        body: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(
              2.4 * SizeConfig.blockSizeVertical!,
            ),
            itemBuilder: (context, index) {
              return friendItem(friendObject: friendObjectList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 2.4 * SizeConfig.blockSizeVertical!,
              );
            },
            itemCount: friendObjectList.length));
  }

  Container friendItem({
    required FriendObject friendObject,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: ColorManager.borderColor,
        ),
        color: ColorManager.lightGreyBackgound,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(friendObject.avatar),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4 * SizeConfig.blockSizeHorizontal!,
                  vertical: SizeConfig.blockSizeVertical!,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      friendObject.name,
                      style: TextStyle(
                        fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: .4 * SizeConfig.blockSizeVertical!,
                    ),
                    Text(
                      friendObject.phone,
                      style: TextStyle(
                        fontSize: 1.4 * SizeConfig.blockSizeVertical!,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 8 * SizeConfig.blockSizeVertical!,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical!,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    21,
                  ),
                  border: Border.all(
                    color: ColorManager.primaryBlue,
                  ),
                  color: friendObject.isInvited
                      ? ColorManager.primaryBlue
                      : ColorManager.lightGreyBackgound,
                ),
                child: Center(
                  child: Text(
                    friendObject.isInvited
                        ? AppLanguage.strings.invitedText
                        : AppLanguage.strings.inviteText,
                    style: TextStyle(
                      color: friendObject.isInvited
                          ? ColorManager.light
                          : ColorManager.primaryBlue,
                      fontSize: 1.6 * SizeConfig.blockSizeVertical!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2 * SizeConfig.blockSizeVertical!,
              )
            ],
          ),
        ],
      ),
    );
  }
}
