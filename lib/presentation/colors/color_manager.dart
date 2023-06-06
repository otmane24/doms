import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryBlue = HexColor.formHex("#2972FE");
  static Color secondaryBlue = HexColor.formHex("#6499FF");
  static Color primaryRed = HexColor.formHex("#FF3B60");
  static Color secondaryRed = HexColor.formHex("#FF7F96");
  static Color dark = HexColor.formHex("#404345");
  static Color darkText = HexColor.formHex("#231F20");
  static Color primaryText = HexColor.formHex("#4485FD");
  static Color blueText = HexColor.formHex("#09101D");
  static Color blueGreyText = HexColor.formHex("#6B779A");
  static Color darkBlueText = HexColor.formHex("#222B45");
  static Color greyText = HexColor.formHex("#A0A4A8");
  static Color hintText = HexColor.formHex("#DADADA");

  static Color borderColor = HexColor.formHex("#DADADA");
  static Color borderColor2 = HexColor.formHex("#EBEEF2");
  static Color light = HexColor.formHex("#FFFFFF");
  static Color lightGrey = HexColor.formHex("#D9D9D9");
  static Color lightGreyBackgound = HexColor.formHex("#F3F3F3");
  static Color bottomBackgound = HexColor.formHex("#FEFEFE");
  static Color textFieldBackgound = HexColor.formHex("#F4F6F9");
  static Color darkGrey = HexColor.formHex("#979797");
  static Color onBoradingBackground1 = HexColor.formHex("#93B8FE");
  static Color onBoradingBackground2 = HexColor.formHex("#EDA1AB");
  static Color onBoradingBackground3 = HexColor.formHex("#00DABE");
  static Color staticDoctorBackground1 = HexColor.formHex("#7AEBFA");
  static Color staticDoctorBackground2 = HexColor.formHex("#E8899E");
  static Color staticDoctorBackground3 = HexColor.formHex("#F7C480");

  static Color redError = HexColor.formHex("#D81617");
  static Color specialDoctorBackground1 = HexColor.formHex("#4485FD");
  static Color specialDoctorBackground1Op = HexColor.formHex("#639AFF");
  static Color specialDoctorBackground2 = HexColor.formHex("#A584FF");
  static Color specialDoctorBackground2Op = HexColor.formHex("#B79CFF");
  static Color specialDoctorBackground3 = HexColor.formHex("#FF7854");
  static Color specialDoctorBackground3Op = HexColor.formHex("#FFA188");
  static Color specialDoctorBackground4 = HexColor.formHex("#FEA725");
  static Color specialDoctorBackground4Op = HexColor.formHex("#FFB547");
  static Color specialDoctorBackground5 = HexColor.formHex("#00CC6A");
  static Color specialDoctorBackground5Op = HexColor.formHex("#1AD37A");
  static Color specialDoctorBackground6 = HexColor.formHex("#00C9E4");
  static Color specialDoctorBackground6Op = HexColor.formHex("#05D1ED");
  static Color specialDoctorBackground7 = HexColor.formHex("#FD44B3");
  static Color specialDoctorBackground7Op = HexColor.formHex("#FF71C6");
  static Color specialDoctorBackground8 = HexColor.formHex("#FD4444");
  static Color specialDoctorBackground8Op = HexColor.formHex("#FF7070");
}

extension HexColor on Color {
  static Color formHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
