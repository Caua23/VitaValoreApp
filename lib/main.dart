import 'package:flutter/material.dart';
import 'package:vita_valore/app.dart';
import 'package:intl/date_symbol_data_local.dart';

//Feito para o Iphone SE

//Repositorio :
//https://github.com/Caua23/VitaValoreApp
void main() async {
  await initializeDateFormatting('pt_BR');
  runApp(const App());
}
