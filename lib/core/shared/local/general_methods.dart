import 'package:flutter/material.dart';

class GeneralMethods {
  static int convertToSinceEpoch(TimeOfDay timeOfDay, DateTime selectedDate) {
    DateTime combinedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    int millisecondsSinceEpoch = combinedDateTime.millisecondsSinceEpoch;
    return millisecondsSinceEpoch;
  }

  static TimeOfDay convertFromSinceEpoch(int epochTime) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochTime);
    return TimeOfDay.fromDateTime(dateTime);
  }
}
