import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/datamodel/task/task_model.dart';
import 'package:flutter/material.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

Iterable<TimeOfDay> getTimeSlots(TimeOfDay startTime, TimeOfDay endTime, Duration interval) sync* {
  var hour = startTime.hour;
  var minute = startTime.minute;

  do {
    yield TimeOfDay(hour: hour, minute: minute);
    minute += interval.inMinutes;
    while (minute >= 60) {
      minute -= 60;
      hour++;
    }
  } while (hour < endTime.hour || (hour == endTime.hour && minute <= endTime.minute));
}

Color getTaskColor(TaskType type) {
  switch (type) {
    case TaskType.personal:
      return kcPersonalColor;
    case TaskType.private:
      return kcPrivateColor;
    case TaskType.secret:
      return kcSecretColor;
    case TaskType.public:
      return kcPublicColor;
    default:
      return kcPersonalColor;
  }
}