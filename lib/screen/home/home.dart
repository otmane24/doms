import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../businnes_logic/bloc/doctor/doctor_bloc.dart';
import '../../components/shimmer/shimmer.dart';
import '../../components/text_field/search_text_field.dart';
import '../../constants/objects/constants_objects.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';
import '../../routing/app_routing.dart';
import 'components/home_app_bar.dart';
import 'components/row_title.dart';
import 'components/special_doctor_item.dart';
import 'components/top_doctor_item.dart';

Widget Home({required BuildContext context, required DoctorBloc doctorBloc}) {
  FocusNode focusNode = FocusNode();
  TextEditingController searchController = TextEditingController();
  return ListView(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: homeAppBar(context: context),
      ),
      SizedBox(
        height: 3 * SizeConfig.blockSizeVertical!,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: RichText(
            text: TextSpan(
          text: AppLanguage.strings.findText,
          style: TextStyle(
            fontSize: 3.4 * SizeConfig.blockSizeVertical!,
            color: ColorManager.dark,
          ),
          children: [
            TextSpan(
              text: AppLanguage.strings.yourDoctorText,
              style: TextStyle(
                fontSize: 3.4 * SizeConfig.blockSizeVertical!,
                color: ColorManager.greyText,
              ),
            ),
          ],
        )),
      ),
      SizedBox(
        height: 3 * SizeConfig.blockSizeVertical!,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: searchTextField(
          focusNode: focusNode,
          controller: searchController,
        ),
      ),
      SizedBox(
        height: 3 * SizeConfig.blockSizeVertical!,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: rowTitleHome(
            title: AppLanguage.strings.specialDoctorText,
            onTap: () => Navigator.of(context)
                .pushNamed(AppRouter.viewAllSpecialRouter)),
      ),
      SizedBox(
        height: 2 * SizeConfig.blockSizeVertical!,
      ),
      SizedBox(
        height: 24 * SizeConfig.blockSizeVertical!,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: specialDoctorObjectList.length,
          itemBuilder: (context, i) {
            return specialDoctorItem(
              specialDoctorObject: specialDoctorObjectList[i],
            );
          },
        ),
      ),
      SizedBox(
        height: 2 * SizeConfig.blockSizeVertical!,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.6 * SizeConfig.blockSizeVertical!,
        ),
        child: rowTitleHome(
          title: AppLanguage.strings.topDoctorText,
          onTap: () => Navigator.of(context).pushNamed(
            AppRouter.viewAllDoctorRouter,
          ),
        ),
      ),
      SizedBox(
        height: 2 * SizeConfig.blockSizeVertical!,
      ),
      BlocBuilder<DoctorBloc, DoctorState>(
        bloc: doctorBloc,
        builder: (context, state) {
          if (state is DoctorLoading) {
            return listViewShimmer();
          }
          if (state is DoctorLoaded) {
            return SizedBox(
              height: 22 * SizeConfig.blockSizeVertical!,
              child: ListView.separated(
                itemCount: state.doctors.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 2.6 * SizeConfig.blockSizeVertical!,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2 * SizeConfig.blockSizeVertical!,
                  );
                },
                itemBuilder: (context, index) {
                  return doctorItem(
                    onTap: () => Navigator.of(context).pushNamed(
                        AppRouter.detailDoctorRouter,
                        arguments: state.doctors[index]),
                    doctor: state.doctors[index],
                  );
                },
              ),
            );
          }
          if (state is DoctorError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
      SizedBox(
        height: 2 * SizeConfig.blockSizeVertical!,
      ),
    ],
  );
}
