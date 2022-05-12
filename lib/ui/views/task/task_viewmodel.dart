import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/datamodel/task/task_model.dart';
import 'package:dailoz/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TaskViewModel extends BaseViewModel {
  DateTime? _selectedDay;
  DateTime? _focusedDay = DateTime.now();

  DateTime? get selectedDay => _selectedDay;

  DateTime? get focusedDay => _focusedDay;

  void updateSelectedDay(DateTime? selectedDay, DateTime? focusDay) {
    _selectedDay = selectedDay;
    _focusedDay = focusDay;
    notifyListeners();
  }

  List<TimeOfDay> get timeSlots {
    const startTime = TimeOfDay(hour: 7, minute: 0);
    const endTime = TimeOfDay(hour: 23, minute: 0);
    const interval = Duration(minutes: 60);

    return getTimeSlots(startTime, endTime, interval).toList();
  }


}
