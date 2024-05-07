
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah_time/data/models/home_page_model.dart';
import 'package:salah_time/presentation/controllers/home_screen_controller.dart';
import 'package:salah_time/presentation/screens/about_app_screen.dart';
import 'package:salah_time/presentation/screens/search_history_screen.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';
import 'package:salah_time/presentation/widgets/create_appbar.dart';
import 'package:salah_time/presentation/widgets/create_drawer_element.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _enterLocationTEController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _homeScreenController = Get.find<HomeScreenController>();

  @override
  void initState() {
    super.initState();
    _homeScreenController.startClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        appbarTitle: "Salah Time",
        actionWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child:
              GetBuilder<HomeScreenController>(builder: (homeScreenController) {
            return Text(
              "${homeScreenController.currentTime}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            );
          }),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 125,
            ),
            createDrawerElement(
              title: "Search History",
              nextScreen: const SearchHistoryScreen(),
            ),
            const SizedBox(
              height: 10,
            ),
            createDrawerElement(
              title: "About",
              nextScreen: const AboutScreen(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _enterLocationTEController,
                  validator: (value) {
                    if (value == null) {
                      return "Enter location";
                    } else if (value.isEmpty) {
                      return "Enter location";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Location",
                    suffixIcon: IconButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            await _homeScreenController
                                .searchSalahTimeViaLocation(
                              _enterLocationTEController.text.trim(),
                            );
                          }
                        },
                        icon: const Icon(Icons.search)),
                  ),
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) async {
                    if (_formKey.currentState!.validate()) {
                      await _homeScreenController
                          .searchSalahTimeViaLocation(value);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<HomeScreenController>(builder: (homeScreenController) {
                return Visibility(
                  visible: homeScreenController.screenShouldBeVisible,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: HomePageModel.noDataToShow
                      ? const Text(
                          "Nothing to show here, search to get result.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    const Text(
                                      "Country : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " ${HomePageModel.countryCode ?? ""} ",
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Wrap(
                                  children: [
                                    const Text(
                                      "City : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " ${HomePageModel.city ?? ""} ",
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Wrap(
                                  children: [
                                    const Text(
                                      "State : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " ${HomePageModel.state ?? ""} ",
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount:
                                  HomePageModel.salahScheduleList?.length,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Card(
                                  elevation: 3,
                                  color: primaryAppColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 11,
                                    ),
                                    title: Text(
                                      "${HomePageModel.salahScheduleList?[index].name}",
                                      style: const TextStyle(
                                        color: primaryAppTextColor,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        Text(
                                          "${HomePageModel.salahScheduleList?[index].time} ",
                                          style: const TextStyle(
                                            color: primaryAppTextColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.alarm,
                                          color: primaryAppTextColor,
                                          size: 21,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Showing result of ${HomePageModel.dataFetchingDate}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _enterLocationTEController.dispose();
  }
}
