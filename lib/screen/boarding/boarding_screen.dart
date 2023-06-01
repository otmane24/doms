import 'package:doms/assistant_methode/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants/objects/constants_objects.dart';
import 'components/page_view_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  // ignore: unused_field
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: sliderObjetList.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) => pageViewItem(
          context: context,
          sliderObjet: sliderObjetList[index],
          currentPage: index,
        ),
      ),
    );
  }
}
