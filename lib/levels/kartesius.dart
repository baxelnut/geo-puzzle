import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Input {
  Input(this.sbY, this.sbX);
  final String sbY;
  final double sbX;
}

class Kartesius extends StatelessWidget {
  const Kartesius({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SfCartesianChart(
                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<Input, String>>[
          LineSeries<Input, String>(
              dataSource: <Input>[
                Input('1', 1),
                Input('2', 2),
              ],
              xValueMapper: (Input sbX, _) => sbX.sbY,
              yValueMapper: (Input sbX, _) => sbX.sbX)
        ])));
  }
}
