import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class LDatePicker extends StatelessWidget {
  final ValueNotifier<DateTime> selectedDate = ValueNotifier(DateTime.now());

  LDatePicker({required int year, required int month, super.key}) {
    selectedDate.value = DateTime(year, month);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.monthYear,
              initialDateTime: DateTime(
                selectedDate.value.year,
                selectedDate.value.month,
              ),
              minimumYear: 1900,
              maximumYear: 2100,
              onDateTimeChanged: (DateTime newDateTime) {
                selectedDate.value = newDateTime;
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      builder: (context) => this,
    ).then((value) => value == true ? selectedDate.value : null);
  }
}
