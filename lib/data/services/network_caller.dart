import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:salah_time/data/utils/networkcall_header_util.dart';

class NetworkCaller {
  Future<dynamic> getRequest(String placeName) async {
    try {
      final requestedObject = await get(
        Uri.parse("https://muslimsalat.p.rapidapi.com/$placeName.json"),
        headers: apiKeyHeader,
      );
      return jsonDecode(requestedObject.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
