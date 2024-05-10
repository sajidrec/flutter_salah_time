import 'package:flutter/material.dart';
import 'package:salah_time/presentation/widgets/create_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Text(
                "Salah time app is created to help muslims for knowing their salah schedule according to location they are searching",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              Wrap(
                children: [
                  const Text(
                    "Source code of this app can be found in ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (await canLaunchUrl(Uri.parse(
                          "https://github.com/sajidrec/flutter_salah_time"))) {
                        await launchUrl(Uri.parse(
                            "https://github.com/sajidrec/flutter_salah_time"));
                      }
                    },
                    child: const Text(
                      "https://github.com/sajidrec/flutter_salah_time",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Wrap(
                children: [
                  const Text(
                    "Api provided by ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (await canLaunchUrl(
                          Uri.parse("https://muslimsalat.com"))) {
                        await launchUrl(Uri.parse("https://muslimsalat.com"));
                      }
                    },
                    child: const Text(
                      "https://muslimsalat.com",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  "Developer name MD. Sajid Hossain",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
