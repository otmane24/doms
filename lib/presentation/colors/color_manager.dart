import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryBlue = HexColor.formHex("#2972FE");
  static Color secondaryBlue = HexColor.formHex("#6499FF");
  static Color dark = HexColor.formHex("#404345");
  static Color darkText = HexColor.formHex("#231F20");
  static Color blueText = HexColor.formHex("#09101D");
  static Color hintText = HexColor.formHex("#DADADA");
  static Color borderColor = HexColor.formHex("#DADADA");
  static Color borderColor2 = HexColor.formHex("#EBEEF2");
  static Color light = HexColor.formHex("#FFFFFF");
  static Color lightGrey = HexColor.formHex("#D9D9D9");
  static Color lightGreyBackgound = HexColor.formHex("#F3F3F3");
  static Color darkGrey = HexColor.formHex("#979797");
  static Color onBoradingBackground1 = HexColor.formHex("#93B8FE");
  static Color onBoradingBackground2 = HexColor.formHex("#EDA1AB");
  static Color onBoradingBackground3 = HexColor.formHex("#00DABE");
  static Color redError = HexColor.formHex("#D81617");
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
