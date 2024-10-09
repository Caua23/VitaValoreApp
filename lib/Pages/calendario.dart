import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  late Map<DateTime, List<Map<String, String>>> events;
  late DateTime selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
    events = {};
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void _addEvent(String event, String time) {
    setState(() {
      if (events[selectedDay] != null) {
        events[selectedDay]!.add({'event': event, 'time': time});
      } else {
        events[selectedDay] = [{'event': event, 'time': time}];
      }
    });
  }

  void _removeEvent(String event) {
    setState(() {
      events[selectedDay]?.removeWhere((e) => e['event'] == event);
      if (events[selectedDay]?.isEmpty ?? true) {
        events.remove(selectedDay);
      }
    });
  }

  void _showAddEventDialog() {
    String newEvent = '';
    String newTime = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Adicionar Lembrete',
            style: TextStyle(
              fontFamily: 'assets/fonts/Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newEvent = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Digite o lembrete',
                  labelStyle: TextStyle(
                    fontFamily: 'assets/fonts/Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    newTime = time.format(context);
                  }
                },
                child: const Text('Selecionar Hora'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newEvent.isNotEmpty && newTime.isNotEmpty) {
                  _addEvent(newEvent, newTime);
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Adicionar',
                style: TextStyle(
                  fontFamily: 'assets/fonts/Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontFamily: 'assets/fonts/Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showRemoveEventDialog(String event) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Remover Lembrete',
            style: TextStyle(
              fontFamily: 'assets/fonts/Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Você tem certeza que deseja remover seu lembrete?',
            style: TextStyle(
              fontFamily: 'assets/fonts/Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _removeEvent(event);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Sim',
                style: TextStyle(
                  fontFamily: 'assets/fonts/Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Não',
                style: TextStyle(
                  fontFamily: 'assets/fonts/Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          _calendarioContainer(),
          _eventList(),
        ],
      ),
    );
  }

  CalendarFormat format = CalendarFormat.month;

  Widget _calendarioContainer() {
    var today = DateTime.now();
    var lastDay = DateTime(today.year, today.month + 3, today.day);
    var firstDay = DateTime(today.year, today.month - 3, today.day);
    return TableCalendar(
      headerStyle: HeaderStyle(
        leftChevronIcon: const Icon(Icons.chevron_left_rounded,
            size: 20, color: Colors.white),
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
        ),
        titleTextFormatter: (today, locale) =>
            DateFormat('MMMM y', locale).format(today),
      ),
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.white),
        defaultTextStyle: TextStyle(color: Colors.white),
        outsideDaysVisible: false,
        todayTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Color.fromARGB(255, 132, 0, 255),
          shape: BoxShape.circle,
        ),
      ),
      focusedDay: selectedDay,
      firstDay: firstDay,
      lastDay: lastDay,
      calendarFormat: format,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mês',
        CalendarFormat.week: 'Semana',
        CalendarFormat.twoWeeks: '2 Semanas',
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
        });

        // Permite adicionar lembretes no dia atual ou dias futuros
        if (!selectedDay
            .isBefore(DateTime(today.year, today.month, today.day - 1))) {
          _showAddEventDialog();
        }
      },
      locale: 'pt_BR',
    );
  }

  Widget _eventList() {
  final eventsForSelectedDay = _getEventsForDay(selectedDay);
  String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDay);

  return Expanded(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Lembretes para $formattedDate',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'assets/fonts/Montserrat',
            ),
          ),
        ),
        if (eventsForSelectedDay.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: eventsForSelectedDay.length,
              itemBuilder: (context, index) {
                var event = eventsForSelectedDay[index];
                return ListTile(
                  title: Text(
                    '${event['event']} - ${event['time']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'assets/fonts/Montserrat',
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete,
                        color: Color.fromARGB(255, 132, 0, 255)),
                    onPressed: () {
                      _showRemoveEventDialog(event['event']!);
                    },
                  ),
                );
              },
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Nenhum lembrete para este dia.',
              style: TextStyle(color: Colors.white),
            ),
          ),
      ],
    ),
  );
}

}