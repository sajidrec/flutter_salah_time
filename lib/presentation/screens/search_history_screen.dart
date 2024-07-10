import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salah_time/presentation/controllers/search_history_screen_controller.dart';
import 'package:salah_time/presentation/widgets/create_appbar.dart';
import 'package:salah_time/presentation/widgets/delete_all_history_confirm_dialog.dart';
import 'package:salah_time/presentation/widgets/pop_up_search_element.dart';

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
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _searchHistoryScreenController.getListOfHistory(),
    );
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
              GetBuilder<SearchHistoryScreenController>(
                  builder: (searchHistoryScreenController) {
                return searchHistoryScreenController.listOfHistory?.length <= 0
                    ? Center(
                        child: Text(
                          "Nothing in history",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : IconButton(
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
                      );
              }),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                width: double.maxFinite,
                child: PopupSearchElement(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
