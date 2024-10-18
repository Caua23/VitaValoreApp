import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vita_valore/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
/*
  Feito para o Iphone SE 
  Repositorio :
  https://github.com/Caua23/VitaValoreApp     
  Meu Github:
  https://github.com/Caua23
  caso de erro verificar o arquivo CasodeERRO.md
  aconcelho a rodar o codigo no terminal , com o seguinte codigo:
  -
  flutter run -d chrome --web-port=3002 --web-hostname=localhost
  -
  isso faz com que o app seja carregado na porta 3002 que ja vem preconfigurada 
  no servidor java/Spring
*/

void main() async {
  try {
    await dotenv.load(fileName: 'assets/.env');
    // WidgetsFlutterBinding.ensureInitialized();
    // await AndroidAlarmManager.initialize();
  } catch (e) {
    if (kDebugMode) {
      print('Erro em algo: $e');
    }
  }

  await initializeDateFormatting('pt_BR');
  runApp(const App());
}
