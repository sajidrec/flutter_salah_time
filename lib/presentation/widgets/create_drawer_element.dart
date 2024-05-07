import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';

SizedBox createDrawerElement({
  required String title,
  required Widget nextScreen,
}) {
  return SizedBox(
    width: double.maxFinite,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: ElevatedButton(
        onPressed: () {
          Get.to(nextScreen);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            primaryAppColor,
          ),
          foregroundColor: MaterialStateProperty.all(
            primaryAppTextColor,
          ),
        ),
        child: Text(title),
      ),
    ),
  );
}