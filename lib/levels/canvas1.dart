// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class CartesianCoordinateCanvas extends StatefulWidget {
//   @override
//   _CartesianCoordinateCanvasState createState() =>
//       _CartesianCoordinateCanvasState();
// }

// class _CartesianCoordinateCanvasState extends State<CartesianCoordinateCanvas> {
//   double x = 0.0;
//   double y = 0.0;

//   List<charts.Series<Coordinate, int>> _createData() {
//     final data = [
//       Coordinate(x.toInt(), y.toInt()),
//     ];

//     return [
//       charts.Series<Coordinate, int>(
//         id: 'Coordinates',
//         domainFn: (Coordinate coord, _) => coord.x,
//         measureFn: (Coordinate coord, _) => coord.y,
//         data: data,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final chart = charts.LineChart(
//       _createData(),
//       animate: true,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Canvas'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'X'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   x = double.tryParse(value) ?? 0.0;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               decoration: InputDecoration(labelText: 'Y'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   y = double.tryParse(value) ?? 0.0;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Coordinates: ($x, $y)',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(child: chart),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Coordinate {
//   final int x;
//   final int y;

//   Coordinate(this.x, this.y);
// }
