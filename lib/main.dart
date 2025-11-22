import 'package:flutter/material.dart';
import 'package:mobile_recruitment_test/core/utils/colors.dart';
import 'package:mobile_recruitment_test/features/month_calendar/month_calendar.dart';
import 'package:mobile_recruitment_test/core/utils/translations.dart';

void main() {
  runApp(const RecruitmentApp());
}

class RecruitmentApp extends StatelessWidget {
  const RecruitmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Translations.appTitle,
      theme: ThemeData(scaffoldBackgroundColor: LColors.background),
      debugShowCheckedModeBanner: false,
      home: const MonthCalendar(),
    );
  }
}
