

import 'package:intl/intl.dart';

String getCurrentDate() {
  // Get the current date and format it
  return DateFormat.yMMMd().format(DateTime.now());
}

String getCurrentTime() {
  // Get the current time
  DateTime now = DateTime.now();
  String formattedTime = DateFormat.jm().format(now);
  return formattedTime;
}

