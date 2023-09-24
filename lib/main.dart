// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_graph/widgets/cartesian_chart.dart';
import 'package:flutter_graph/widgets/live_chart.dart';
import 'package:flutter_graph/widgets/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Grpahs",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mooliTextTheme(Theme.of(context).textTheme),
        brightness: Brightness.dark,
      ),
      home: LiveChart(),
    );
  }
}
