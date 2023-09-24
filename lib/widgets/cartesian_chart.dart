//line charts, area charts, scatter plots, bar charts are included in cartesian chart which is also known to be xy chart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({super.key});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  //SalesData is the class
  final List<SalesData> chartData = [
    SalesData(year: 2001, sales: 35500, color: Colors.red),
    SalesData(year: 2002, sales: 55500, color: Colors.blue),
    SalesData(year: 2003, sales: 65500, color: Colors.white),
    SalesData(year: 2004, sales: 15500, color: Colors.brown),
    SalesData(year: 2005, sales: 25500, color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cartesian Graph",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          // color: Colors.blue,
          margin: EdgeInsets.all(10),
          child: SfCartesianChart(
            legend: Legend(isVisible: true),
            title: ChartTitle(
              text: "Year vs Sales",
            ),
            series: <ChartSeries>[
              LineSeries<SalesData, int>(
                legendItemText: "Sales",
                pointColorMapper: (SalesData sale, _) => sale.color,
                dataSource: chartData,
                xValueMapper: (SalesData sale, _) => sale.year,
                yValueMapper: (SalesData sale, _) => sale.sales,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final int year;
  final double sales;
  final Color color;

  SalesData({required this.year, required this.sales, required this.color});
}
