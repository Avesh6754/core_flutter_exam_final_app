import 'package:core_flutter_exam_final_app/screen/adddata.dart';
import 'package:core_flutter_exam_final_app/screen/home.dart';
import 'package:core_flutter_exam_final_app/screen/update.dart';
import 'package:core_flutter_exam_final_app/screen/view.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/data': (context) => Adddata(),
        '/up': (context) => Update(),
        '/view': (context) => Viewscreen(),
      },
    );
  }
}
