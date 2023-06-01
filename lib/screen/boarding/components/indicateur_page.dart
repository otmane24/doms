import 'package:doms/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';

Widget indicateurPage({required bool isCurrentPage}) => AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color:
            isCurrentPage ? ColorManager.primaryBlue : ColorManager.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
