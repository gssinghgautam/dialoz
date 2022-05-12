import 'package:flutter/material.dart';

enum TaskType { personal, work, private, meeting, events, board }

enum TaskStatus { completed, pending, ongoing, canceled }

class TaskModel {
  final String title;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String description;
  final TaskType type;
  final TaskStatus taskStatus;
  final List<String>? tags;

  TaskModel({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.type,
    required this.taskStatus,
    this.tags,
  });
}

final taskList = [
  TaskModel(
      title: 'Cleaning Clothes',
      date: DateTime.now(),
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      description: 'Clean all the dirty clothes',
      type: TaskType.personal,
      taskStatus: TaskStatus.pending,
      tags: ['Home', 'Urgent']),
  TaskModel(
      title: 'Cleaning Clothes',
      date: DateTime.now(),
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      description: 'Clean all the dirty clothes',
      type: TaskType.private,
      taskStatus: TaskStatus.pending,
      tags: ['Home', 'Urgent']),
  TaskModel(
      title: 'Cleaning Clothes',
      date: DateTime.now(),
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      description: 'Clean all the dirty clothes',
      type: TaskType.secret,
      taskStatus: TaskStatus.pending,
      tags: ['Home', 'Urgent']),
  TaskModel(
      title: 'Cleaning Clothes',
      date: DateTime.now(),
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      description: 'Clean all the dirty clothes',
      type: TaskType.public,
      taskStatus: TaskStatus.pending,
      tags: ['Home', 'Urgent'])
];
