import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

var today = DateTime.now();
var lastDay = DateTime(today.year, today.month + 3, today.day);
var firstDay = DateTime(today.year, today.month - 3, today.day);

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: _calendarioContainer(),
    );
  }
}

CalendarFormat format = CalendarFormat.month;

Widget _calendarioContainer() {
  return TableCalendar(
    headerStyle: HeaderStyle(
      leftChevronIcon:
          const Icon(Icons.chevron_left_rounded, size: 20, color: Colors.white),
      rightChevronIcon: const Icon(Icons.chevron_right_rounded,
          size: 20, color: Colors.white),
      headerPadding: EdgeInsets.zero,
      headerMargin: EdgeInsets.zero,
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'assets/fonts/Monserrat',
      ),
      titleTextFormatter: (today, locale) =>
          DateFormat('MMMM y', locale).format(today),
    ),
    calendarStyle: const CalendarStyle(
      weekendTextStyle: TextStyle(
        color: Colors.white,
      ),
      defaultTextStyle: TextStyle(
        color: Colors.white,
      ),
      outsideDaysVisible: false,
      todayTextStyle: TextStyle(
        color: Colors.white,
      ),
      todayDecoration: BoxDecoration(
        color: Color.fromARGB(255, 132, 0, 255),
        shape: BoxShape.circle,
      ),
    ),
    focusedDay: today,
    firstDay: firstDay,
    lastDay: lastDay,
    calendarFormat: format,
    startingDayOfWeek: StartingDayOfWeek.monday,
    availableCalendarFormats: const {
      CalendarFormat.month: 'Mês',
      CalendarFormat.week: 'Semana',
      CalendarFormat.twoWeeks: '2 Semanas',
    },
    calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
      String text = '';

      if (day.weekday == DateTime.sunday) {
        text = 'Dom';
      } else if (day.weekday == DateTime.monday) {
        text = 'Seg';
      } else if (day.weekday == DateTime.tuesday) {
        text = 'Ter';
      } else if (day.weekday == DateTime.wednesday) {
        text = 'Qua';
      } else if (day.weekday == DateTime.thursday) {
        text = 'Qui';
      } else if (day.weekday == DateTime.friday) {
        text = 'Sext';
      } else if (day.weekday == DateTime.saturday) {
        text = 'Sáb';
      } else {
        text = 'erro';
      }

      return Center(
          child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ));
    }),
    locale: 'pt_BR',
  );
}
