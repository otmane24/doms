import 'package:doms/businnes_logic/cubit/state_cubit.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assistant_methode/size_config.dart';
import '../../../components/card/selected_item.dart';
import '../../../presentation/colors/color_manager.dart';
import '../../../presentation/laungaes/main.dart';
import 'components/expansion_faq_item.dart';

class Faq extends StatelessWidget {
  Faq({super.key});
  String isSelected = 'General';
  StateCubit stateCubit = StateCubit(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.faqAppBarText,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2 * SizeConfig.blockSizeVertical!,
          ),
          BlocBuilder<StateCubit, bool>(
            bloc: stateCubit,
            builder: (context, state) {
              return SizedBox(
                height: 6 * SizeConfig.blockSizeVertical!,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: 2 * SizeConfig.blockSizeVertical!,
                      vertical: 1 * SizeConfig.blockSizeVertical!),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return selectedItem(
                        onTap: () {
                          isSelected = faqSelectedList[index];
                          stateCubit.setBlocState(newState: !state);
                        },
                        text: faqSelectedList[index],
                        isSelected: isSelected == faqSelectedList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 1.2 * SizeConfig.blockSizeVertical!,
                    );
                  },
                  itemCount: faqSelectedList.length,
                ),
              );
            },
          ),
          SizedBox(
            height: 2 * SizeConfig.blockSizeVertical!,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return expansionFaqItem(
                  name: faqList[index]['name']!,
                  answer: faqList[index]['answer']!,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 2 * SizeConfig.blockSizeVertical!,
                );
              },
              itemCount: faqList.length,
            ),
          ),
        ],
      ),
    );
  }
}
