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

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // TODO: add query-name in sharedPref...

      if (sharedPreferences.getStringList("history") != null) {

        final List<String> newListForAddition = sharedPreferences.getStringList(
          "history",
        )!;

        newListForAddition.insert(0, jsonEncode(data["items"]));

        sharedPreferences.setStringList("history", newListForAddition);
      } else {
        sharedPreferences.setStringList("history", [
          jsonEncode(data["items"]),
        ]);
      }

      print("sajid testing -> ${sharedPreferences.getStringList("history")}");
    } else {
      locationNotFoundAlert();
    }

    _screenShouldBeVisible = true;
    update();
  }

  startClock() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      _currentTime = DateFormat().add_jm().format(DateTime.now());
      update();
    });
  }
}
