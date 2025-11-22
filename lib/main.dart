import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_recruitment_test/core/services/get_it.dart';
import 'package:mobile_recruitment_test/core/utils/colors.dart';
import 'package:mobile_recruitment_test/features/month_calendar/bloc/month_bloc.dart';
import 'package:mobile_recruitment_test/features/month_calendar/pages/month_calendar.dart';
import 'package:mobile_recruitment_test/core/utils/translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

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
      home: BlocProvider(
        create: (context) => getIt<MonthBloc>(),
        child: MonthCalendar(),
      ),
    );
  }
}
