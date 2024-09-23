import 'package:flutter/material.dart';

import 'package:vita_valore/principal.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vita Valore',
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
