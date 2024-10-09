import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vita_valore/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/*
  Feito para o Iphone SE 
  

  Repositorio :
  https://github.com/Caua23/VitaValoreApp
  Meu Github:
  https://github.com/Caua23
  caso de erro verificar o arquivo CasodeERRO.md
*/

void main() async {
  try {
    await dotenv.load(fileName: 'assets/.env');
    print('${dotenv.env['API_URL']}/auth/user/register');
  } catch (e) {
    if (kDebugMode) {
      print('Erro ao carregar o .env: $e');
    }
  }

  await initializeDateFormatting('pt_BR');
  runApp(const App());
}
