import 'package:doms/businnes_logic/bloc/doctor/doctor_bloc.dart';
import 'package:doms/components/buttons/card_icon_button.dart';
import 'package:doms/components/shimmer/shimmer.dart';
import 'package:doms/components/text_field/search_text_field.dart';
import 'package:doms/constants/strings/constants_strings.dart';
import 'package:doms/routing/app_routing.dart';
import 'package:doms/screen/home/components/top_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assistant_methode/size_config.dart';
import '../../components/bottom_sheet/primary_bottom_sheet.dart';
import '../../components/card/row_card_doctor.dart';
import '../../presentation/colors/color_manager.dart';
import '../../presentation/laungaes/main.dart';

class FavoriteDoctor extends StatefulWidget {
  const FavoriteDoctor({super.key});

  @override
  State<FavoriteDoctor> createState() => _FavoriteDoctorState();
}

class _FavoriteDoctorState extends State<FavoriteDoctor> {
  FocusNode focusNode = FocusNode();

  TextEditingController searchController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  DoctorBloc doctorBloc = DoctorBloc();

  @override
  void initState() {
    doctorBloc.add(const GetDoctor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorManager.lightGreyBackgound,
        title: Text(
          AppLanguage.strings.favoriteDoctorAppBarText,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: .5 * SizeConfig.blockSizeVertical!,
                horizontal: 1.5 * SizeConfig.blockSizeVertical!),
            child:
                cardIconButton(imagePath: '$svgsPath/filtre.svg', onTap: () {}),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 2.6 * SizeConfig.blockSizeVertical!),
        child: Column(
          children: [
            SizedBox(height: 2.4 * SizeConfig.blockSizeVertical!),
            searchTextField(focusNode: focusNode, controller: searchController),
            SizedBox(height: 2.4 * SizeConfig.blockSizeVertical!),
            BlocBuilder<DoctorBloc, DoctorState>(
              bloc: doctorBloc,
              builder: (context, state) {
                if (state is DoctorLoading) {
                  return gridDoctorShimmer();
                }
                if (state is DoctorLoaded) {
                  return Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      crossAxisSpacing: 2 * SizeConfig.blockSizeVertical!,
                      childAspectRatio: .9,
                      crossAxisCount: 2,
                      mainAxisSpacing: 2 * SizeConfig.blockSizeVertical!,
                      children: [
                        for (var i = 0; i < state.doctors.length; i++)
                          Stack(
                            children: [
                              doctorItem(
                                  onTap: () => Navigator.of(context).pushNamed(
                                      AppRouter.detailDoctorRouter,
                                      arguments: state.doctors[i]),
                                  doctor: state.doctors[i],
                                  width: double.infinity),
                              Positioned(
                                  top: SizeConfig.blockSizeVertical!,
                                  right: SizeConfig.blockSizeVertical!,
                                  child: cardIconButton(
                                    imagePath: '$svgsPath/like.svg',
                                    onTap: () {
                                      primaryBottomSheet(
                                        context: context,
                                        body: rowCardDoctor(
                                          onTap: () => Navigator.of(context)
                                              .pushNamed(
                                                  AppRouter.detailDoctorRouter,
                                                  arguments: state.doctors[i]),
                                          doctor: state.doctors[i],
                                        ),
                                        title: AppLanguage
                                            .strings.removeFavoriteText,
                                        cancelText:
                                            AppLanguage.strings.cancelButton,
                                        confrimText:
                                            AppLanguage.strings.yesRemoveButton,
                                        onCancel: () {},
                                        onConfrim: () {},
                                      );
                                    },
                                    width: 3 * SizeConfig.blockSizeVertical!,
                                    height: 3 * SizeConfig.blockSizeVertical!,
                                  )),
                            ],
                          )
                      ],
                    ),
                  );
                }
                if (state is DoctorError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
