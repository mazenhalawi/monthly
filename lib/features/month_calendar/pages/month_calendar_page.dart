import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_recruitment_test/core/errors/failure.dart';
import 'package:mobile_recruitment_test/core/utils/colors.dart';
import 'package:mobile_recruitment_test/core/utils/styles.dart';
import 'package:mobile_recruitment_test/core/widgets/alert_box.dart';
import 'package:mobile_recruitment_test/core/widgets/failure_widget.dart';
import 'package:mobile_recruitment_test/features/month_calendar/bloc/month_bloc.dart';
import 'package:mobile_recruitment_test/features/month_calendar/models/month_data.dart';
import 'package:mobile_recruitment_test/features/month_calendar/models/month_engine_data.dart';
import 'package:mobile_recruitment_test/core/widgets/text.dart';
import 'package:mobile_recruitment_test/core/utils/translations.dart';
import 'package:mobile_recruitment_test/features/month_calendar/widgets/l_date_picker.dart';

/// Main calendar widget that displays a monthly calendar view.
class MonthCalendarPage extends StatelessWidget {
  const MonthCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MonthBloc, MonthState>(
        listenWhen: (prev, curr) => curr.isListenerState,
        buildWhen: (prev, curr) => !curr.isListenerState,
        listener: (context, state) {
          state.maybeWhen(
            displayAlert:
                (title, message, data, shouldPopOut, isListenerState) =>
                    AlertBox(title: title, message: message)
                        .show(context)
                        .then(
                          (value) =>
                              shouldPopOut && context.mounted
                                  ? Navigator.of(context).pop()
                                  : null,
                        ),
            orElse:
                () =>
                    throw UnimplementedError(
                      '$state was not implemented in the listener of $this',
                    ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: (data, _) => _getInitialState(context),
            loading:
                (data, _) => _getLoadingState(context: context, data: data),
            loadFailure:
                (failure, retryAction, data, _) => _getLoadFailureState(
                  context: context,
                  failure: failure,
                  retryAction: retryAction,
                ),
            loadSuccess:
                (data, _) => _getLoadSuccessState(context: context, data: data),
            orElse:
                () =>
                    throw UnimplementedError(
                      '$state was not implemented in the builder of $this',
                    ),
          );
        },
      ),
    );
  }

  void _selectMonthYear({
    required BuildContext context,
    required int year,
    required int month,
  }) {
    LDatePicker(year: year, month: month).show(context).then((selectedDate) {
      if (context.mounted && selectedDate != null) {
        context.read<MonthBloc>()
          ..add(MonthEvent.setDate(selectedDate))
          ..add(MonthEvent.getMonthCalendar());
      }
    });
  }
}

extension StateWidgets on MonthCalendarPage {
  Widget _getInitialState(BuildContext context) {
    context.read<MonthBloc>().add(MonthEvent.getMonthCalendar());
    return Container();
  }

  Widget _getLoadingState({required BuildContext context, MonthData? data}) {
    return Center(child: CircularProgressIndicator());
  }

  Widget _getLoadFailureState({
    required BuildContext context,
    required Failure failure,
    required MonthEvent retryAction,
  }) {
    return FailureWidget(
      failure: failure,
      onRetryPressed: () => context.read<MonthBloc>().add(retryAction),
    );
  }

  Widget _getLoadSuccessState({
    required BuildContext context,
    required MonthData data,
  }) {
    return data.month.isEmpty
        ? const SizedBox()
        : Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _getCalendarHeader(context, data),
                ),
                _getDaysHeader(),
                ..._getGeneratedWeeks(data),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: _getMonthNavigation(context),
                ),
              ],
            ),
          ),
        );
  }

  Row _getMonthNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 110,
          child: ElevatedButton(
            onPressed:
                () => context.read<MonthBloc>().add(
                  MonthEvent.gotoPreviousMonth(),
                ),
            style: LButtonStyle,
            child: Text("Previous"),
          ),
        ),
        SizedBox(
          width: 110,
          child: ElevatedButton(
            onPressed:
                () => context.read<MonthBloc>().add(MonthEvent.gotoNextMonth()),
            style: LButtonStyle,
            child: Text("Next"),
          ),
        ),
      ],
    );
  }

  List<Widget> _getGeneratedWeeks(MonthData data) {
    return List.generate(
      KMonthEngine.rowCount,
      (rowIndex) => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          KMonthEngine.columnCount,
          (columnIdx) => SizedBox(
            width: 50.0,
            height: 80.0,
            child:
                data.month[rowIndex]?[columnIdx]?.isFromThisScope ?? false
                    ? Container(
                      alignment: Alignment.topCenter,
                      color: LColors.shade1,
                      child: LText(
                        text: data.month[rowIndex]![columnIdx]!.day.toString(),
                        type: LTextType.small,
                        fontWeight:
                            data.month[rowIndex]![columnIdx]!.isToday
                                ? FontWeight.bold
                                : null,
                      ),
                    )
                    : null,
          ),
        ),
      ),
    );
  }

  Row _getDaysHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        KMonthEngine.columnCount,
        (index) => Container(
          width: 50.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 8.0),
          child: LText(
            text: Translations.weekdayMap[index + 1]!,
            type: LTextType.medium,
          ),
        ),
      ),
    );
  }

  GestureDetector _getCalendarHeader(BuildContext context, MonthData data) {
    return GestureDetector(
      onTap:
          () => _selectMonthYear(
            context: context,
            year: data.selectedPeriod.year,
            month: data.selectedPeriod.month,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LText(
            text: Translations.monthsMap[data.selectedPeriod.month]!,
            type: LTextType.large,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 8),
          LText(
            text: data.selectedPeriod.year.toString(),
            type: LTextType.large,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: 8),
          Icon(Icons.edit, size: 20, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
