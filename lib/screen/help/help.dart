import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:flutter/material.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/card/help_item.dart';
import '../../presentation/laungaes/main.dart';

class HelpSetting extends StatelessWidget {
  const HelpSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.notificationAppBarText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
            ),
            helpItem(
              name: AppLanguage.strings.FaqHelpText,
              onTap: () => Navigator.of(context).pushNamed(AppRouter.faqRouter),
            ),
            const Divider(
              thickness: 1,
            ),
            helpItem(
              name: AppLanguage.strings.contactUsHelpText,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRouter.contactUsRouter),
            ),
            const Divider(
              thickness: 1,
            ),
            helpItem(
              name: AppLanguage.strings.termConditionHelpText,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRouter.termConditionRouter),
            ),
            const Divider(
              thickness: 1,
            ),
            helpItem(
              name: AppLanguage.strings.privacyPolicyHelpText,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRouter.privacyPolicyRouter),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
