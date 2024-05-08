//dummy text format
// ["Rangpur", {"date_for":"2024-5-8","fajr":"3:57 am","shurooq":"5:16 am",
// "dhuhr":"11:59 am","asr":"4:39 pm",
// "maghrib":"6:42 pm","isha":"8:01 pm",}]

class HistoryElementModel {
  String placeName, date, fajr, shurooq, dhuhr, asr, maghrib, isha;

  HistoryElementModel({
    required this.placeName,
    required this.date,
    required this.fajr,
    required this.shurooq,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
}
