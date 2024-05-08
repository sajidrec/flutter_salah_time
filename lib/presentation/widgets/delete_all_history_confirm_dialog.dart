import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah_time/presentation/controllers/search_history_screen_controller.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';

void deleteAllHistoryConfirmDialog({required String message}) {
  Get.dialog(
    AlertDialog(
      contentPadding: const EdgeInsets.all(16),
      title: Text(message),
      content: Row(
        children: [
          const Spacer(),
          GetBuilder<SearchHistoryScreenController>(
              builder: (searchHistoryScreenController) {
            return ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  primaryAppTextColor,
                ),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () async {
                await searchHistoryScreenController.clearAllHistory();
                Get.back();
              },
              child: const Text("YES"),
            );
          }),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                primaryAppTextColor,
              ),
              backgroundColor: MaterialStateProperty.all(
                primaryAppColor,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text("NO"),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
