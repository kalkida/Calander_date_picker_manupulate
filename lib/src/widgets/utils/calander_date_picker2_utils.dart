// import 'package:calendar_date_picker2/src/Bloc/calander_class.dart';
// import 'package:calendar_date_picker2/src/Bloc/calander_event_Bloc.dart';
// import 'package:calendar_date_picker2/src/models/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

//   final CalendarBloc _calendarBloc = CalendarBloc();
//   List<DateTime?> _values = [];
//   List<DateTime?> _editCache = [];

// Widget _buildTodayButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: StatefulBuilder(
//         builder: (context, setState)  {
//         return InkWell(
//           borderRadius: BorderRadius.circular(5),
//           onTap: () => setState(() {
//             _values = [DateTime.now(), DateTime.now()];
      
//             config.onTodayTapped?.call();
//             _editCache.add(DateTime.now());
//             _calendarBloc.add(CalendarValueChangedEvent(_values));
//             config.selectedDayHighlightColor = Colors.purple[800];
//           }),
//           child: Container(
//             padding: config.buttonPadding ??
//                 const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//             child: const Text(
//               'Today',
//               style: TextStyle(),
//             ),
//           ),
//         );},
//       )
//   );
//   }

//   Widget _buildYesterdayButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           _values = [DateTime.now().subtract(const Duration(days: 1))];
//           config.onYesterdayTapped?.call();
//           _editCache.add(DateTime.now().subtract(const Duration(days: 1)));

//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'Yesterday',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildThisWeekButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           _values = [
//             DateTime.now().subtract(const Duration(days: 0)),
//             DateTime.now().add(const Duration(days: 7))
//           ];
//           widget.config.onThisWeekTapped?.call();
//           _editCache = [
//             DateTime.now().subtract(const Duration(days: 0)),
//             DateTime.now().add(const Duration(days: 7))
//           ];
//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'This Week',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLastWeekButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           _values = [
//             DateTime.now().subtract(const Duration(days: 7)),
//             DateTime.now().subtract(const Duration(days: 1))
//           ];
//           widget.config.onLastWeekTapped?.call();
//           _editCache = [
//             DateTime.now().subtract(const Duration(days: 7)),
//             DateTime.now().subtract(const Duration(days: 1))
//           ];
//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'Last Week',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAllTimeButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           _values = [DateTime(1923, 1, 1), DateTime(2050, 1, 1)];
//           widget.config.onAllTimeTapped?.call();
//           _editCache = [DateTime(1923, 1, 1), DateTime(2050, 1, 1)];

//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'All Time',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildThisMonthButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           if (DateUtils.isSameMonth(
//               DateTime.now(), DateTime.now().add(const Duration(days: 5)))) {
//             _values = [
//               DateTime(DateTime.now().year, DateTime.now().month, 1),
//               DateTime(DateTime.now().year, DateTime.now().month, 31)
//             ];
//           }
//           widget.config.onThisMonthTapped?.call();
//           _editCache = [
//             DateTime(DateTime.now().year, DateTime.now().month, 1),
//             DateTime(DateTime.now().year, DateTime.now().month, 31)
//           ];

//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'This Month',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildThisYearButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           _values = [
//             DateTime(DateTime.now().year, 1, 1),
//             DateTime(DateTime.now().year, 12, 31)
//           ];
//           widget.config.onThisYearTapped?.call();
//           _editCache = [
//             DateTime(DateTime.now().year, 1, 1),
//             DateTime(DateTime.now().year, 12, 31)
//           ];

//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'This Year',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLastYearButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           _values = [
//             DateTime(
//                 DateTime.now().subtract(const Duration(days: 367)).year, 1, 1),
//             DateTime(
//                 DateTime.now().subtract(const Duration(days: 367)).year, 12, 31)
//           ];
//           widget.config.onLastYearTapped?.call();
//           _editCache = [
//             DateTime(
//                 DateTime.now().subtract(const Duration(days: 367)).year, 1, 1),
//             DateTime(
//                 DateTime.now().subtract(const Duration(days: 367)).year, 12, 31)
//           ];

//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'Last Year',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLastMonthButton(
//     ColorScheme colorScheme,
//     MaterialLocalizations localizations,
//     //void Function(List<DateTime?>) onLastMonthTapped,
//   ) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => _calendarBloc,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(5),
//         onTap: () {
//           if (DateUtils.isSameMonth(
//               DateTime.now(), DateTime.now().add(const Duration(days: 5)))) {
//             _values = [
//               DateTime(DateTime.now().year,
//                   DateTime.now().subtract(const Duration(days: 35)).month, 1),
//               DateTime(DateTime.now().year,
//                   DateTime.now().subtract(const Duration(days: 35)).month, 31)
//             ];
//           }
//           //onLastMonthTapped(_values);
//           widget.config.onLastMonthTapped?.call(context, _values);
//           _editCache = [
//             DateTime(DateTime.now().year,
//                 DateTime.now().subtract(const Duration(days: 35)).month, 1),
//             DateTime(DateTime.now().year,
//                 DateTime.now().subtract(const Duration(days: 35)).month, 31)
//           ];

//           _calendarBloc.add(CalendarValueChangedEvent(_values));
//         },
//         child: Container(
//           // Customize the button appearance as desired
//           padding: widget.config.buttonPadding ??
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: const Text(
//             'Last Month',
//             style: TextStyle(
//                 // Customize the button text style as desired
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

