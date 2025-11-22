import 'package:get_it/get_it.dart';
import 'package:mobile_recruitment_test/core/services/month_engine.dart';
import 'package:mobile_recruitment_test/features/month_calendar/bloc/month_bloc.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  // blocs
  getIt.registerFactory<MonthBloc>(
    () => MonthBloc(engine: getIt<MonthEngine>()),
  );

  // services
  getIt.registerLazySingleton<MonthEngine>(() => MonthEngine());
}
