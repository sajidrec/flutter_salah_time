import 'package:flutter/material.dart';
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
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 25,
                  itemBuilder: (context, index) => Card(
                    color: primaryAppColor.shade400,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Column(
                            children: [
                              Text(
                                "Rangpur",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: primaryAppTextColor,
                                ),
                              ),
                              Text(
                                "13-13-2022",
                                style: TextStyle(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
