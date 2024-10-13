import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  late Map<DateTime, List<Map<String, String>>> eventos;
  DateTime? diaSelecionado;
  DateTime? lastTapped;
  final Duration doubleTapDuration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    diaSelecionado = null;
    eventos = {};
  }

  List<Map<String, String>> _getEventoDia(DateTime day) {
    return eventos[day] ?? [];
  }

  void _adicionaEvento(String evento, String tempo) {
    setState(() {
      if (eventos[diaSelecionado!] != null) {
        eventos[diaSelecionado!]!.add({'evento': evento, 'tempo': tempo});
      } else {
        eventos[diaSelecionado!] = [{'evento': evento, 'tempo': tempo}];
      }
      eventos[diaSelecionado!]!.sort(
        (a, b) => DateFormat.jm().parse(a['tempo']!).compareTo(
              DateFormat.jm().parse(b['tempo']!),
            ),
      );
    });
  }

  void _removeEvento(String evento) {
    setState(() {
      eventos[diaSelecionado]?.removeWhere((e) => e['evento'] == evento);
      if (eventos[diaSelecionado]?.isEmpty ?? true) {
        eventos.remove(diaSelecionado);
      }
    });
  }

  void _mostrarAdicaoEvento() {
    String novoEvento = '';
    String novaHora = '';
    final ScrollController _scrollController = ScrollController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Color.fromRGBO(132, 0, 255, 1),
              width: 5,
            ),
          ),
          title: const Text(
            'Adicionar Lembrete',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
                            novoEvento = value;
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
                        Text(novaHora.isNotEmpty ? novaHora : '',
                            style: const TextStyle(color: Colors.white)),
                        InkWell(
                          splashColor: Colors.transparent, // Desativa o efeito
                          onTap: () async {
                            TimeOfDay? hora = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (hora != null) {
                              novaHora = hora.format(context);
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
                if (novoEvento.isNotEmpty && novaHora.isNotEmpty) {
                  _adicionaEvento(novoEvento, novaHora);
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

  void _showRemoveEventDialog(String evento) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 1), width: 2),
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
                _removeEvento(evento);
                Navigator.of(context).pop();
              },
              child: const Text('Sim', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não', style: TextStyle(color: Colors.white)),
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
          // Calendário
          TableCalendar(
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
              titleTextFormatter: (hoje, local) =>
                  DateFormat('MMMM y', local).format(hoje),
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
            focusedDay: diaSelecionado ?? DateTime.now(),
            firstDay: DateTime(DateTime.now().year, DateTime.now().month - 3, DateTime.now().day),
            lastDay: DateTime(DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Mês',
              CalendarFormat.week: 'Semana',
              CalendarFormat.twoWeeks: '2 Semanas',
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.diaSelecionado = selectedDay;
              });

              final hoje = DateTime.now();

              if (selectedDay
                  .isBefore(DateTime(hoje.year, hoje.month, hoje.day - 1))) {
                return;
              }

              if (lastTapped != null &&
                  hoje.difference(lastTapped!) < doubleTapDuration) {
                _mostrarAdicaoEvento();
              }

              lastTapped = hoje;
            },
            locale: 'pt_BR',
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (contexto, dia, diaDeHoje) {
                bool hasEvents = eventos[dia]?.isNotEmpty ?? false;
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        '${dia.day}',
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
          ),
          // Lista de eventos
          Expanded(
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
                        if (diaSelecionado != null &&
                            !diaSelecionado!
                                .isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)))
                          Text(
                            DateFormat('dd/MM/yyyy').format(diaSelecionado!),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (diaSelecionado != null)
                    ..._getEventoDia(diaSelecionado!).map((evento) {
                      ValueNotifier<bool> isExpanded = ValueNotifier(false);
                      bool isLongEvent = (evento['evento']!.split('\n').length > 4);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                                        evento['tempo']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.white),
                                        onPressed: () {
                                          _showRemoveEventDialog(evento['evento']!);
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
                                            evento['evento']!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                            maxLines: expanded || !isLongEvent ? null : 2,
                                            overflow: expanded || !isLongEvent
                                                ? TextOverflow.visible
                                                : TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );
  }
}
