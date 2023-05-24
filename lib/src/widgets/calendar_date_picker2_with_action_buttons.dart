import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calendar_date_picker2/src/Bloc/calander_class.dart';
import 'package:calendar_date_picker2/src/Bloc/calander_event_Bloc.dart';
import 'package:calendar_date_picker2/src/Bloc/calander_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarDatePicker2WithActionButtons extends StatefulWidget {
  const CalendarDatePicker2WithActionButtons({
    required this.value,
    required this.config,
    this.onValueChanged,
    this.onDisplayedMonthChanged,
    this.onCancelTapped,
    this.onOkTapped,
    Key? key,
  }) : super(key: key);

  final List<DateTime?> value;

  /// Called when the user taps 'OK' button
  final ValueChanged<List<DateTime?>>? onValueChanged;

  /// Called when the user navigates to a new month/year in the picker.
  final ValueChanged<DateTime>? onDisplayedMonthChanged;

  /// The calendar configurations including action buttons
  final CalendarDatePicker2WithActionButtonsConfig config;

  /// The callback when cancel button is tapped
  final Function? onCancelTapped;

  /// The callback when ok button is tapped
  final Function? onOkTapped;

  @override
  State<CalendarDatePicker2WithActionButtons> createState() =>
      _CalendarDatePicker2WithActionButtonsState();
}

class _CalendarDatePicker2WithActionButtonsState
    extends State<CalendarDatePicker2WithActionButtons> {
  List<DateTime?> _values = [];
  List<DateTime?> _editCache = [];

  @override
  void initState() {
    _values = widget.value;
    _editCache = widget.value;
    super.initState();
  }

  final CalendarBloc _calendarBloc = CalendarBloc();

  @override
  void dispose() {
    _calendarBloc.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(
      covariant CalendarDatePicker2WithActionButtons oldWidget) {
    var isValueSame = oldWidget.value.length == widget.value.length;

    if (isValueSame) {
      for (var i = 0; i < oldWidget.value.length; i++) {
        var isSame = (oldWidget.value[i] == null && widget.value[i] == null) ||
            DateUtils.isSameDay(oldWidget.value[i], widget.value[i]);
        if (!isSame) {
          isValueSame = false;
          break;
        }
      }
    }

    if (!isValueSame) {
      _values = widget.value;
      _editCache = widget.value;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(550, 440)),
          child: BlocBuilder<CalendarBloc, CalendarState>(
              bloc: _calendarBloc,
              builder: (context, state) {
                if (state is CalendarValueUpdatedState) {
                  _editCache = state.values;
                } else if (state is CalendarDisplayedMonthUpdatedState) {
                  // Call the onDisplayedMonthChanged callback if needed
                  widget.onDisplayedMonthChanged!(state.month);
                }
                return
                    //create: (context) => _calendarBloc,
                    Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 500,
                        height: 540,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 300),
                            _buildTodayButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildYesterdayButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildThisWeekButton(
                              Theme.of(context).colorScheme,
                              localizations,
                            ),
                            const SizedBox(width: 300),
                            _buildLastWeekButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildThisMonthButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildLastMonthButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildThisYearButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildLastYearButton(
                                Theme.of(context).colorScheme, localizations),
                            const SizedBox(width: 300),
                            _buildAllTimeButton(
                                Theme.of(context).colorScheme, localizations),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 600,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 130,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffD0D5DD),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "${_editCache.first!.year} - ${_editCache.first!.month} - ${_editCache.first!.day}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color(0xff101828),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff667085),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width: 130,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffD0D5DD),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "${_editCache.last!.year} - ${_editCache.last!.month} - ${_editCache.last!.day}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Color(0xff101828),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              MediaQuery.removePadding(
                                  context: context,
                                  child: Expanded(
                                    child: CalendarDatePicker2(
                                      value: _editCache,
                                      config: widget.config,
                                      onValueChanged: (values) {
                                        _calendarBloc.add(
                                            CalendarValueChangedEvent(values));
                                        // setState(() {
                                        //   _editCache = values;
                                        // });
                                      },
                                      // onDisplayedMonthChanged: (month) {
                                      //   _calendarBloc.add(
                                      //       CalendarDisplayedMonthChangedEvent(
                                      //           month));
                                      // }
                                      onDisplayedMonthChanged:
                                          widget.onDisplayedMonthChanged,
                                    ),
                                  )
                                  //}
                                  ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  widget.config.gapBetweenCalendarAndButtons ??
                                      10),
                          SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildCancelButton(
                                    Theme.of(context).colorScheme,
                                    localizations),
                                if ((widget.config
                                            .gapBetweenCalendarAndButtons ??
                                        0) >
                                    0)
                                  SizedBox(
                                      width: widget
                                          .config.gapBetweenCalendarAndButtons),
                                _buildOkButton(Theme.of(context).colorScheme,
                                    localizations),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ));
  }

  Widget _buildCancelButton(
      ColorScheme colorScheme, MaterialLocalizations localizations) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => setState(() {
        _editCache = _values;
        widget.onCancelTapped?.call();
        if ((widget.config.openedFromDialog ?? false) &&
            (widget.config.closeDialogOnCancelTapped ?? true)) {
          Navigator.pop(context);
        }
      }),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffD0D5DD)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          // color: ,
          width: 142,
          height: 40,
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: widget.config.cancelButton ??
              Text(
                localizations.cancelButtonLabel.toUpperCase(),
                textAlign: TextAlign.center,
                style: widget.config.cancelButtonTextStyle ??
                    const TextStyle(
                      color: Color(0xff344054),
                      // widget.config.selectedDayHighlightColor ??
                      //     colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
              ),
        ),
      ),
    );
  }

  Widget _buildOkButton(
      ColorScheme colorScheme, MaterialLocalizations localizations) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => setState(() {
        _values = _editCache;
        widget.onValueChanged?.call(_values);
        widget.onOkTapped?.call();
        if ((widget.config.openedFromDialog ?? false) &&
            (widget.config.closeDialogOnOkTapped ?? true)) {
          Navigator.pop(context, _values);
        }
      }),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff7F56D9),
            borderRadius: BorderRadius.circular(10)),
        // color: ,
        width: 142,
        height: 40,
        padding: widget.config.buttonPadding ??
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: widget.config.okButton ??
            const Text(
              'Apply',
              textAlign: TextAlign.center,
              //localizations.okButtonLabel.toUpperCase(),
              style:
                  //widget.config.okButtonTextStyle ??
                  TextStyle(
                color: Colors.white,
                //widget.config.selectedDayHighlightColor ??colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
      ),
    );
  }

/////Laba
  ///

  Widget _buildTodayButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => setState(() {
          _values = [DateTime.now(), DateTime.now()];

          widget.config.onTodayTapped?.call();
          _editCache.add(DateTime.now());
          _calendarBloc.add(CalendarValueChangedEvent(_values));
          widget.config.selectedDayHighlightColor = Colors.purple[800];
        }),
        child: Container(
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'Today',
            style: TextStyle(),
          ),
        ),
      ),
    );
  }

  Widget _buildYesterdayButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _values = [DateTime.now().subtract(const Duration(days: 1))];
          widget.config.onYesterdayTapped?.call();
          _editCache.add(DateTime.now().subtract(const Duration(days: 1)));

          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'Yesterday',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildThisWeekButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _values = [
            DateTime.now().subtract(const Duration(days: 0)),
            DateTime.now().add(const Duration(days: 7))
          ];
          widget.config.onThisWeekTapped?.call();
          _editCache = [
            DateTime.now().subtract(const Duration(days: 0)),
            DateTime.now().add(const Duration(days: 7))
          ];
          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'This Week',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastWeekButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _values = [
            DateTime.now().subtract(const Duration(days: 7)),
            DateTime.now().subtract(const Duration(days: 1))
          ];
          widget.config.onLastWeekTapped?.call();
          _editCache = [
            DateTime.now().subtract(const Duration(days: 7)),
            DateTime.now().subtract(const Duration(days: 1))
          ];
          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'Last Week',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildAllTimeButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _values = [DateTime(1923, 1, 1), DateTime(2050, 1, 1)];
          widget.config.onAllTimeTapped?.call();
          _editCache = [DateTime(1923, 1, 1), DateTime(2050, 1, 1)];

          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'All Time',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildThisMonthButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          if (DateUtils.isSameMonth(
              DateTime.now(), DateTime.now().add(const Duration(days: 5)))) {
            _values = [
              DateTime(DateTime.now().year, DateTime.now().month, 1),
              DateTime(DateTime.now().year, DateTime.now().month, 31)
            ];
          }
          widget.config.onThisMonthTapped?.call();
          _editCache = [
            DateTime(DateTime.now().year, DateTime.now().month, 1),
            DateTime(DateTime.now().year, DateTime.now().month, 31)
          ];

          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'This Month',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildThisYearButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _values = [
            DateTime(DateTime.now().year, 1, 1),
            DateTime(DateTime.now().year, 12, 31)
          ];
          widget.config.onThisYearTapped?.call();
          _editCache = [
            DateTime(DateTime.now().year, 1, 1),
            DateTime(DateTime.now().year, 12, 31)
          ];

          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'This Year',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastYearButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _values = [
            DateTime(
                DateTime.now().subtract(const Duration(days: 367)).year, 1, 1),
            DateTime(
                DateTime.now().subtract(const Duration(days: 367)).year, 12, 31)
          ];
          widget.config.onLastYearTapped?.call();
          _editCache = [
            DateTime(
                DateTime.now().subtract(const Duration(days: 367)).year, 1, 1),
            DateTime(
                DateTime.now().subtract(const Duration(days: 367)).year, 12, 31)
          ];

          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'Last Year',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastMonthButton(
    ColorScheme colorScheme,
    MaterialLocalizations localizations,
    //void Function(List<DateTime?>) onLastMonthTapped,
  ) {
    return BlocProvider<CalendarBloc>(
      create: (context) => _calendarBloc,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          if (DateUtils.isSameMonth(
              DateTime.now(), DateTime.now().add(const Duration(days: 5)))) {
            _values = [
              DateTime(DateTime.now().year,
                  DateTime.now().subtract(const Duration(days: 35)).month, 1),
              DateTime(DateTime.now().year,
                  DateTime.now().subtract(const Duration(days: 35)).month, 31)
            ];
          }
          //onLastMonthTapped(_values);
          widget.config.onLastMonthTapped?.call(context, _values);
          _editCache = [
            DateTime(DateTime.now().year,
                DateTime.now().subtract(const Duration(days: 35)).month, 1),
            DateTime(DateTime.now().year,
                DateTime.now().subtract(const Duration(days: 35)).month, 31)
          ];

          _calendarBloc.add(CalendarValueChangedEvent(_values));
        },
        child: Container(
          // Customize the button appearance as desired
          padding: widget.config.buttonPadding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'Last Month',
            style: TextStyle(
                // Customize the button text style as desired
                ),
          ),
        ),
      ),
    );
  }
}
