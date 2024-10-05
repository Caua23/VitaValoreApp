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
  DateTime? selectedDay;
  DateTime? lastTapped;
  final Duration doubleTapDuration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    selectedDay = null;
    events = {};
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void _addEvent(String event, String time) {
    setState(() {
      if (events[selectedDay!] != null) {
        events[selectedDay!]!.add({'event': event, 'time': time});
      } else {
        events[selectedDay!] = [
          {'event': event, 'time': time}
        ];
      }
      events[selectedDay!]!.sort((a, b) => DateFormat.jm()
          .parse(a['time']!)
          .compareTo(DateFormat.jm().parse(b['time']!)));
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
    final ScrollController _scrollController = ScrollController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
                color: Color.fromRGBO(132, 0, 255, 1), width: 5),
          ),
          title: const Text(
            'Adicionar Lembrete',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: 120,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: TextField(
                          onChanged: (value) {
                            newEvent = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Digite o lembrete',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          maxLines: null,
                          minLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(newTime.isNotEmpty ? newTime : '',
                            style: const TextStyle(color: Colors.white)),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              newTime = time.format(context);
                              setState(() {});
                            }
                          },
                          child: const Text('Selecionar Hora',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newEvent.isNotEmpty && newTime.isNotEmpty) {
                  _addEvent(newEvent, newTime);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Adicionar',
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.white)),
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
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 1),
                width: 2),
          ),
          title: const Text('Remover Lembrete',
              style: TextStyle(color: Colors.white)),
          content: const Text(
            'Você tem certeza que deseja remover seu lembrete?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _removeEvent(event);
                Navigator.of(context).pop();
              },
              child: const Text('Sim', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('Não', style: TextStyle(color: Colors.white)),
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
      focusedDay: selectedDay ?? today,
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

        final now = DateTime.now();

        if (selectedDay.isBefore(DateTime(now.year, now.month, now.day - 1))) {
          return;
        }

        if (lastTapped != null &&
            now.difference(lastTapped!) < doubleTapDuration) {
          _showAddEventDialog();
        }

        lastTapped = now;
      },
      locale: 'pt_BR',
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          bool hasEvents = events[day]?.isNotEmpty ?? false;
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              if (hasEvents)
                Container(
                  margin: const EdgeInsets.only(top: 0.0),
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _eventList() {
    final eventsForSelectedDay =
        selectedDay != null ? _getEventsForDay(selectedDay!) : [];
    String formattedDate = selectedDay != null
        ? DateFormat('dd/MM/yyyy').format(selectedDay!)
        : '';
    var today = DateTime.now();

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Lembretes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (selectedDay != null &&
                      !selectedDay!
                          .isBefore(DateTime(today.year, today.month, today.day)))
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            if (eventsForSelectedDay.isNotEmpty)
              ...eventsForSelectedDay.map((event) {
                ValueNotifier<bool> isExpanded = ValueNotifier(false);
                bool isLongEvent = (event['event']!.split('\n').length > 4);

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: const Color.fromARGB(255, 40, 40, 40),
                    child: SizedBox(
                      width: 320,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  event['time']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.white),
                                  onPressed: () {
                                    _showRemoveEventDialog(event['event']!);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            ValueListenableBuilder<bool>(
                              valueListenable: isExpanded,
                              builder: (context, expanded, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event['event']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                      maxLines: expanded || !isLongEvent ? null : 2,
                                      overflow: expanded || !isLongEvent
                                          ? TextOverflow.visible
                                          : TextOverflow.ellipsis,
                                    ),
                                    if (isLongEvent && !expanded)
                                      TextButton(
                                        onPressed: () {
                                          isExpanded.value = true;
                                        },
                                        child: const Text(
                                          'Ver mais',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    if (isLongEvent && expanded)
                                      TextButton(
                                        onPressed: () {
                                          isExpanded.value = false;
                                        },
                                        child: const Text(
                                          'Ver menos',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList()
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
      ),
    );
  }
}
