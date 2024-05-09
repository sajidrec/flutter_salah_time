import 'dart:convert';

import 'package:get/get.dart';
import 'package:salah_time/data/models/history_element_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryScreenController extends GetxController {
  final List<HistoryElementModel> _listOfHistory = [];

  get listOfHistory => _listOfHistory;

  Future<void> getListOfHistory() async {
    _listOfHistory.clear();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getStringList("history") != null) {
      for (int i = 0;
          i < (sharedPreferences.getStringList("history")!.length);
          i += 2) {
        HistoryElementModel newHistory = HistoryElementModel(
          placeName: sharedPreferences.getStringList("history")![i],
          date: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["date_for"],
          fajr: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["fajr"],
          shurooq: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["shurooq"],
          dhuhr: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["dhuhr"],
          asr: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["asr"],
          maghrib: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["maghrib"],
          isha: jsonDecode(
              sharedPreferences.getStringList("history")![i + 1])["isha"],
        );

        _listOfHistory.add(newHistory);
      }
      update();
    }
  }

  Future<void> clearAllHistory() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.remove("history");
    _listOfHistory.clear();
    update();
  }
}
