import 'package:flutter/material.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';

AppBar createAppBar({required String appbarTitle, Widget? actionWidget}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      appbarTitle,
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
    backgroundColor: primaryAppColor,
    foregroundColor: primaryAppTextColor,
    actions: [actionWidget ?? const Text("")],
  );
}
