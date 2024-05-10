import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salah_time/presentation/screens/home_screen.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';
import 'package:salah_time/presentation/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryAppColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsPath().logoPath,
              colorFilter: const ColorFilter.mode(
                primaryAppTextColor,
                BlendMode.srcIn,
              ),
              semanticsLabel: "Salah Time Logo",
            ),
            const SizedBox(height: 5),
            const Text(
              "Salah Time",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: primaryAppTextColor,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                minHeight: 5,
                borderRadius: BorderRadius.circular(5),
                color: primaryAppTextColor,
                backgroundColor: primaryAppColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _moveToNextScreen() async {
  await Future.delayed(const Duration(seconds: 2));
  Get.off(const HomeScreen());
}
