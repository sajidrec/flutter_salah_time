import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salah_time/data/models/home_page_model.dart';
import 'package:salah_time/data/models/waqt_model.dart';
import 'package:salah_time/data/services/network_caller.dart';
import 'package:salah_time/presentation/widgets/location_not_found_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  String _currentTime = DateFormat().add_jm().format(DateTime.now());

  get currentTime => _currentTime;

  bool _screenShouldBeVisible = true;

  get screenShouldBeVisible => _screenShouldBeVisible;

  Future<void> searchSalahTimeViaLocation(String locationName) async {
    _screenShouldBeVisible = false;
    update();

    final data = await NetworkCaller().getRequest(locationName);

    if (data["status_description"] == "Success.") {
      HomePageModel.country = data["country"];
      HomePageModel.city = data["city"];
      HomePageModel.state = data["state"];
      HomePageModel.countryCode = data["country_code"];
      HomePageModel.dataFetchingDate = data["items"][0]["date_for"];

      List<WaqtModel> waqtList = [];

      bool skipFirstObject = false;

      data["items"][0].forEach((waqtName, waqtTime) {
        if (!skipFirstObject) {
          skipFirstObject = true;
        } else {
          waqtList.add(
            WaqtModel(
              name: waqtName.toString(),
              time: waqtTime.toString(),
            ),
          );
        }
      });

      HomePageModel.salahScheduleList = waqtList;

      HomePageModel.noDataToShow = false;

      await _saveHistoryInLocalStorage(data);
    } else {
      locationNotFoundAlert();
    }

    _screenShouldBeVisible = true;
    update();
  }

  startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime = DateFormat().add_jm().format(DateTime.now());
      update();
    });
  }

  Future<void> _saveHistoryInLocalStorage(dynamic data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> currentData = [];

    currentData.add(jsonEncode(data["query"]).toString());
    currentData.add(jsonEncode(data["items"][0]).toString());

    if ((sharedPreferences.getStringList("history")?.length ?? 0) > 0) {
      final List<String> newListForAddition = sharedPreferences.getStringList(
        "history",
      )!;

      newListForAddition.insert(0, currentData[1]); // place name
      newListForAddition.insert(0, currentData[0]); // data object

      await sharedPreferences.setStringList("history", newListForAddition);
    } else {
      await sharedPreferences.setStringList(
        "history",
        currentData,
      );
    }
  }
}
