// ignore_for_file: prefer_const_constructors, unused_field, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({super.key});

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  List<LiveData> getChartData() {
    return [
      LiveData(time: 0, speed: 44.40),
      LiveData(time: 5, speed: 45.40),
      LiveData(time: 10, speed: 44.0),
      LiveData(time: 15, speed: 44.70),
      LiveData(time: 20, speed: 42.80),
      LiveData(time: 25, speed: 41.90),
      LiveData(time: 30, speed: 45.40),
    ];
  }

  int time = 10;
  updateDataSource(Timer timer) {
    chartData.add(
        LiveData(time: time, speed: 40 + math.Random().nextInt(45 + 1) - 40));
    time++;
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Live Chart",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        margin: EdgeInsets.all(10),
        child: SfCartesianChart(
          legend: Legend(isVisible: true),
          series: [
            LineSeries<LiveData, int>(
              animationDuration: 3000,
              dataSource: chartData,
              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              xValueMapper: (LiveData data, _) => data.time,
              yValueMapper: (LiveData data, _) => data.speed,
            )
          ],
        ),
      ),
    );
  }
}

class LiveData {
  final int time;
  final num speed;

  LiveData({required this.time, required this.speed});
}
