// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  final List<PieData> feedPieData = [
    PieData(44.5, 'Mathematics'),
    PieData(48, 'Physics'),
    PieData(49, 'Chemistry'),
    PieData(45, 'Computer Science'),
    PieData(44, 'English'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pie Chart",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        // color: Colors.blue,
        child: SfCircularChart(
          title: ChartTitle(text: "Marks Per subject visualization"),
          legend: Legend(isVisible: true),
          series: [
            // y and x
            PieSeries<PieData, String>(
              animationDuration: 2000.0,
              dataLabelMapper: (PieData ins, _) => ins.xValue,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              explode: true,
              explodeIndex: 2,
              radius: '170',
              strokeColor: Colors.black,
              strokeWidth: 3,
              dataSource: feedPieData,
              xValueMapper: (PieData ins, _) => ins.xValue,
              yValueMapper: (PieData ins, _) => ins.yValue,
            ),
          ],
        ),
      ),
    );
  }
}

class PieData {
  final num yValue;
  final String xValue;

  PieData(this.yValue, this.xValue);
}
