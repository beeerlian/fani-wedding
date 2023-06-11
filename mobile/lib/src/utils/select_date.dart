import 'package:flutter/material.dart';

selectDateTime(
  BuildContext context, {
  required Function(DateTime) onPicked,
  DateTime? initialDateTime,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime initialDate = initialDateTime ?? DateTime.now();
  final TimeOfDay initialTime = TimeOfDay.fromDateTime(initialDate);

  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(3005),
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      final DateTime pickedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      onPicked(pickedDateTime);
    }
  }
}