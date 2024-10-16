import 'package:flutter/material.dart';
import 'package:vita_valore/Widget/agua_diaria.dart';
import 'package:vita_valore/Widget/arc_progress.dart';
import 'dart:math' as math;
import 'package:vita_valore/models/agua_models.dart';

class AguaPage extends StatefulWidget {
  const AguaPage({super.key});

  @override
  State<AguaPage> createState() => _AguaPageState();
}

class _AguaPageState extends State<AguaPage>
    with SingleTickerProviderStateMixin {
  int totalAguaMl = 0;
  late AnimationController _controlador;
  double progresso = 0.0;
  final double progressoMaximo = math.pi;

  List<AguaModels> horarios = [];
  List<bool> iconesClicados = [];

  @override
  void initState() {
    super.initState();
    _controlador = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void aumentarProgresso(int indice) {
    if (!iconesClicados[indice]) {
      setState(() {
        iconesClicados[indice] = true;

        double incremento = progressoMaximo / horarios.length;

        progresso += incremento;

        if (progresso > progressoMaximo) {
          progresso = progressoMaximo;
        }
      });

      _controlador.forward(from: 0);
    }
  }

  void distribuirAgua(int totalMl, String horarioInicio, String horarioFim) {
    TimeOfDay? inicio = _converterHorario(horarioInicio);
    TimeOfDay? fim = _converterHorario(horarioFim);

    if (inicio == null || fim == null || totalMl <= 0) {
      return;
    }

    int totalMinutos = _diferencaEmMinutos(inicio, fim);
    int intervalos = totalMinutos ~/ 60;

    if (intervalos > 0) {
      int mlPorIntervalo = totalMl ~/ intervalos;

      List<AguaModels> novosHorarios = [];
      TimeOfDay horarioAtual = inicio;

      for (int i = 0; i < intervalos; i++) {
        String horarioFormatado = _formatarHorario24(horarioAtual);
        novosHorarios
            .add(AguaModels(time: horarioFormatado, ml: '$mlPorIntervalo'));

        horarioAtual = _incrementarHorario(horarioAtual, 60);
      }

      setState(() {
        horarios = novosHorarios;
        iconesClicados = List.generate(horarios.length, (index) => false);
        totalAguaMl = totalMl;
      });
    }
  }

  int _diferencaEmMinutos(TimeOfDay inicio, TimeOfDay fim) {
    final minutosInicio = inicio.hour * 60 + inicio.minute;
    final minutosFim = fim.hour * 60 + fim.minute;
    return minutosFim - minutosInicio;
  }

  TimeOfDay _incrementarHorario(TimeOfDay horario, int minutos) {
    final totalMinutos = horario.hour * 60 + horario.minute + minutos;
    final novaHora = totalMinutos ~/ 60;
    final novosMinutos = totalMinutos % 60;
    return TimeOfDay(hour: novaHora, minute: novosMinutos);
  }

  TimeOfDay? _converterHorario(String horario) {
    final partes = horario.split(':');
    if (partes.length == 2) {
      final hora = int.tryParse(partes[0]);
      final minuto = int.tryParse(partes[1]);
      if (hora != null && minuto != null) {
        return TimeOfDay(hour: hora, minute: minuto);
      }
    }
    return null;
  }

  String _formatarHorario24(TimeOfDay horario) {
    String hour = horario.hour.toString().padLeft(2, '0');
    String minute = horario.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _construirCabecalho(),
            AnimatedBuilder(
              animation: _controlador,
              builder: (context, child) {
                double progressoAtual = progresso * _controlador.value;
                return ArcProgress(progress: progressoAtual);
              },
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 48, top: 40),
              alignment: Alignment.center,
              width: 300,
              child: Center(
                child: Row(
                  children: [
                    const Text("0ml", style: TextStyle(color: Colors.white)),
                    const Spacer(),
                    Text(
                      "$totalAguaMl ml",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: _construirCaixaIngestaoAgua(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 119, 0, 255),
        shape: const CircleBorder(),
        onPressed: () {
          _mostrarDialogoEntradaAgua(context);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _mostrarDialogoEntradaAgua(BuildContext context) {
    final TextEditingController controladorAgua = TextEditingController();
    final TextEditingController controladorHorarioInicio =
        TextEditingController();
    final TextEditingController controladorHorarioFim = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 132, 0, 255),
          title: const Text(
            'Distribuir água diária',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Quantos ml deseja beber no dia?',
                  style: TextStyle(color: Colors.white)),
              TextField(
                controller: controladorAgua,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'ml',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Horário de início (00:00)',
                  style: TextStyle(color: Colors.white)),
              TextField(
                controller: controladorHorarioInicio,
                keyboardType: TextInputType.datetime,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: '00:00',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Horário de fim (00:00)',
                  style: TextStyle(color: Colors.white)),
              TextField(
                controller: controladorHorarioFim,
                keyboardType: TextInputType.datetime,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: '00:00',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                int totalMl = int.parse(controladorAgua.text);
                String horarioInicio = controladorHorarioInicio.text;
                String horarioFim = controladorHorarioFim.text;

                distribuirAgua(totalMl, horarioInicio, horarioFim);
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  Widget _construirCabecalho() {
    return Stack(
      children: [
        const Spacer(),
        Transform.translate(
          offset: const Offset(90, -20),
          child: Image.asset(
            'assets/Ze_gotinha_da_agua.png',
            height: 125,
          ),
        ),
      ],
    );
  }

  Widget _construirCaixaIngestaoAgua() {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 0, 12),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: AguaDiaria(
          iconesClicados: iconesClicados,
          aguaList: horarios,
          onIconPressed: aumentarProgresso,
        ),
      ),
    );
  }
}
