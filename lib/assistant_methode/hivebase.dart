import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/strings/constants_strings.dart';

class HiveBase {
  static HiveBase hiveBase = HiveBase();

  late Box settings;

  static Future init() async {
    Directory directory = await getApplicationDocumentsDirectory();

    Hive.init(directory.path);

    hiveBase.settings = await Hive.openBox(settingsBoxHive);
  }

  Future<void> setLanguage(String language) async =>
      await settings.put(languageHiveKey, language);

  Future<void> setOnBoadringShow(bool isShow) async =>
      await settings.put(boardingHiveKey, isShow);

  String? getLanguage() => settings.get(languageHiveKey, defaultValue: 'En');

  bool? getOnBoadringShow() =>
      settings.get(boardingHiveKey, defaultValue: false);

  void removeLanguage() => settings.delete(languageHiveKey);

  void removeOnBoadringShow() => settings.delete(boardingHiveKey);

  static Future removeAllData() async {
    await hiveBase.settings.clear();
  }
}
