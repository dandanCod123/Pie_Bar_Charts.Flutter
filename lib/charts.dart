import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class ChartExample extends StatefulWidget {
  @override
  _ChartExampleState createState() => _ChartExampleState();
}

class _ChartExampleState extends State<ChartExample> {
  List<PieChartSectionData> _pieChartData = [];
  List<BarChartGroupData> _barChartData = [];

  @override
  void initState() {
    super.initState();
    _generateChartData();
  }

  void _generateChartData() {
    // Gerar dados para o gráfico de pizza
    List<double> pieData = [30, 20, 50];
    _pieChartData = pieData.asMap().entries.map((entry) {
      int index = entry.key;
      double value = entry.value;
      return PieChartSectionData(
        value: value,
        color: _getRandomColor(index),
        title: '${value.toStringAsFixed(0)}%',
      );
    }).toList();

    // Gerar dados para o gráfico de barras
    List<double> barData = [10, 20, 30, 40, 50];
    _barChartData = barData.asMap().entries.map((entry) {
      int index = entry.key;
      double value = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            color: Colors.amber,
            width: 16,
          ),
        ],
      );
    }).toList();
  }

  Color _getRandomColor(int index) {
    List<Color> colors = [
      Colors.green,
      Colors.red,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Example'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: _pieChartData,
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                groupsSpace: 20,
                barGroups: _barChartData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
