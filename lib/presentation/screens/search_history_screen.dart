import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah_time/presentation/controllers/search_history_screen_controller.dart';
import 'package:salah_time/presentation/utils/app_colors.dart';
import 'package:salah_time/presentation/widgets/create_appbar.dart';
import 'package:salah_time/presentation/widgets/delete_all_history_confirm_dialog.dart';
import 'package:salah_time/presentation/widgets/delete_history_element_confirm_dialog.dart';

class SearchHistoryScreen extends StatefulWidget {
  const SearchHistoryScreen({super.key});

  @override
  State<SearchHistoryScreen> createState() => _SearchHistoryScreenState();
}

class _SearchHistoryScreenState extends State<SearchHistoryScreen> {
  final SearchHistoryScreenController _searchHistoryScreenController =
      Get.find<SearchHistoryScreenController>();

  @override
  void initState() {
    super.initState();
    _searchHistoryScreenController.getListOfHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        appbarTitle: "Search History",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                color: Colors.red,
                onPressed: () {
                  deleteAllHistoryConfirmDialog(
                    message: "You sure want to clear all history?",
                  );
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  size: 35,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.maxFinite,
                child: GetBuilder<SearchHistoryScreenController>(
                    builder: (searchHistoryScreenController) {
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount:
                        searchHistoryScreenController.listOfHistory.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.dialog(AlertDialog(
                          backgroundColor: primaryAppColor,
                          contentTextStyle: const TextStyle(
                              color: primaryAppTextColor, fontSize: 25),
                          titleTextStyle: const TextStyle(
                            color: primaryAppTextColor,
                            fontSize: 27,
                          ),
                          title: Text(
                            searchHistoryScreenController
                                .listOfHistory[index].placeName
                                .substring(
                                    1,
                                    searchHistoryScreenController
                                            .listOfHistory[index]
                                            .placeName
                                            .length -
                                        1),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // TODO: refactor the code
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Fajr",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].fajr}",
                                    style: const TextStyle(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Shurooq",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].shurooq}",
                                    style: const TextStyle(),
                                  )
                                ],
                              ),
                              const SizedBox(),
                              Row(
                                children: [
                                  const Text(
                                    "Dhuhr",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].dhuhr}",
                                    style: const TextStyle(),
                                  )
                                ],
                              ),
                              const SizedBox(),
                              Row(
                                children: [
                                  const Text(
                                    "Asr",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].asr}",
                                    style: const TextStyle(),
                                  )
                                ],
                              ),
                              const SizedBox(),
                              Row(
                                children: [
                                  const Text(
                                    "Maghrib",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].maghrib}",
                                    style: const TextStyle(),
                                  )
                                ],
                              ),
                              const SizedBox(),
                              Row(
                                children: [
                                  const Text(
                                    "Isha",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].isha}",
                                    style: const TextStyle(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "Close",
                                    style: TextStyle(
                                      color: primaryAppTextColor,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                      child: Card(
                        color: primaryAppColor.shade400,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].placeName.substring(1, searchHistoryScreenController.listOfHistory[index].placeName.length - 1)}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      color: primaryAppTextColor,
                                    ),
                                  ),
                                  Text(
                                    "${searchHistoryScreenController.listOfHistory[index].date}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: primaryAppTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  deleteHistoryElementConfirmDialog(
                                    message:
                                        "You sure want to delete this history?",
                                    index: index,
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: primaryAppTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
