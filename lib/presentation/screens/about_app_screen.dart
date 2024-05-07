import 'package:flutter/material.dart';
import 'package:salah_time/presentation/widgets/create_appbar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        appbarTitle: "About",
      ),
    );
  }
}
