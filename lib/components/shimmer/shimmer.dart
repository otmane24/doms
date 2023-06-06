import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../assistant_methode/size_config.dart';

Widget doctorShimmer() {
  return Shimmer.fromColors(
    baseColor: const Color.fromARGB(150, 227, 227, 227),
    highlightColor: const Color.fromARGB(250, 200, 200, 200),
    direction: ShimmerDirection.ltr,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.red,
      ),
      padding: EdgeInsets.only(
          bottom: 40 * SizeConfig.blockSizeVertical!,
          left: 40 * SizeConfig.blockSizeVertical!,
          right: 40 * SizeConfig.blockSizeVertical!),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!),
      width: 34 * SizeConfig.blockSizeHorizontal!,
      height: 21 * SizeConfig.blockSizeVertical!,
    ),
  );
}

Widget gridDoctorShimmer() {
  return GridView(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: .9,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
    ),
    children: [
      doctorShimmer(),
      doctorShimmer(),
      doctorShimmer(),
      doctorShimmer(),
      doctorShimmer(),
      doctorShimmer(),
    ],
  );
}

Widget listViewShimmer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 21 * SizeConfig.blockSizeVertical!,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            doctorShimmer(),
            doctorShimmer(),
            doctorShimmer(),
            doctorShimmer(),
            doctorShimmer(),
            doctorShimmer(),
          ],
        ),
      ),
    ],
  );
}
