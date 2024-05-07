import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';

void locationNotFoundAlert() {
  Get.dialog(
    AlertDialog(
      title: const Text(
        "Location not found",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 27,
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: primaryAppTextColor,
      content: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          foregroundColor: MaterialStateProperty.all(primaryAppTextColor),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "OK",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
