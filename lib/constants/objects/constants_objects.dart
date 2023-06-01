import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/presentation/colors/color_manager.dart';
import 'package:doms/presentation/laungaes/main.dart';

import '../../screen/boarding/components/slider_objects.dart';

List<SliderObjet> sliderObjetList = [
  SliderObjet(
    image: '$pngsPath/onBorading1.png',
    title: AppLanguage.strings.onBoardingTitle1,
    description: AppLanguage.strings.onBoardingSubTitle1,
    backgroundColor: ColorManager.onBoradingBackground1,
  ),
  SliderObjet(
    image: '$pngsPath/onBorading2.png',
    title: AppLanguage.strings.onBoardingTitle2,
    description: AppLanguage.strings.onBoardingSubTitle2,
    backgroundColor: ColorManager.onBoradingBackground2,
  ),
  SliderObjet(
    image: '$pngsPath/onBorading3.png',
    title: AppLanguage.strings.onBoardingTitle3,
    description: AppLanguage.strings.onBoardingSubTitle3,
    backgroundColor: ColorManager.onBoradingBackground3,
  ),
];
