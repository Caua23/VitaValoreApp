import 'package:flutter/material.dart';
import 'package:vita_valore/principal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 667), // Tamanho do iPhone SE
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return const MaterialApp(
      title: 'Vita Valore',
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
