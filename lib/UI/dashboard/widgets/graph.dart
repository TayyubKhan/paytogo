import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utilities/dummy_dataset.dart';

class Graph extends StatefulWidget {
  const Graph({
    super.key,
    required this.timePeriod,
    this.showTouchInfo = false,
  });

  final bool showTouchInfo;
  final double timePeriod;

  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<Graph> {
  // final String _selectedPrice = "";

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots =
    generateGradualCryptoChartData(timePeriod: widget.timePeriod);
    final maxValue =
        spots.reduce((curr, next) => curr.y > next.y ? curr : next).y;
    return LineChart(

      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: const LineTouchTooltipData(
            showOnTopOfTheChartBoxArea: true,
            tooltipBgColor: Colors.transparent,

            tooltipPadding: EdgeInsets.zero,
            tooltipMargin: 0,
            fitInsideVertically: true,
            fitInsideHorizontally: true,
            tooltipBorder: BorderSide.none,
          ),
          enabled: widget.showTouchInfo,
        ),

        backgroundColor: Colors.transparent,
        lineBarsData: [
          LineChartBarData(
            barWidth: 1.5,
            spots: spots,
            isCurved: false, // Keep the line straight
            dotData: const FlDotData(show: false), // Hide dots
            belowBarData: BarAreaData(
              show: false,
              spotsLine: const BarAreaSpotsLine(show: false),
            ), // Hide area below line
            color: Theme.of(context).colorScheme.surface,
          ),
        ],
        minX: 0, // Adjust minimum X-axis value as needed
        maxX: widget.timePeriod, // Adjust maximum X-axis value as needed
        minY: 0, // Adjust minimum Y-axis value as needed
        maxY:
            maxValue + maxValue * 0.2, // Adjust maximum Y-axis value as needed
        titlesData: const FlTitlesData(
          show: false,
        ),
        clipData: const FlClipData.all(),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false), // Hide grid lines
      ),
    );
  }
}

// class Graph extends StatefulWidget {
//   const Graph({super.key});
//
//   @override
//   State<Graph> createState() => _GraphState();
// }
//
// class _GraphState extends State<Graph> {
//   final Color sinColor = Colors.blue;
//   final Color cosColor = Colors.pink;
//
//   final limitCount = 100;
//   final sinPoints = <FlSpot>[];
//   final cosPoints = <FlSpot>[];
//
//   double x = 0;
//   double step = 0.05;
//   late Timer timer;
//
//   @override
//   void initState() {
//     timer = Timer.periodic(
//       const Duration(milliseconds: 50),
//       (timer) {
//         while (sinPoints.length > limitCount) {
//           sinPoints.removeAt(0);
//           cosPoints.removeAt(0);
//         }
//         setState(() {
//           sinPoints.add(FlSpot(x, .5 * sin(20 + x) + .5 * sin(5 + x)));
//           cosPoints.add(FlSpot(x, cos(x)));
//           x += step;
//         });
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return cosPoints.isNotEmpty
//         ? Column(
//             children: [
//               const SizedBox(height: 20),
//               Text(x.toStringAsFixed(1),
//                   style: ThemeTextStyle.bodyLarge(context)),
//               Text('cos(x): ${cosPoints.last.y.toStringAsFixed(3)}',
//                   style: ThemeTextStyle.bodyMedium(context)),
//               const SizedBox(height: 20),
//               AspectRatio(
//                 aspectRatio: 1.5,
//                 child: LineChart(
//                   LineChartData(
//                     minY: -1,
//                     maxY: 1,
//                     minX: sinPoints.first.x,
//                     maxX: sinPoints.last.x,
//                     lineTouchData: const LineTouchData(enabled: false),
//                     clipData: const FlClipData.all(),
//                     gridData: const FlGridData(show: false),
//                     borderData: FlBorderData(show: false),
//                     lineBarsData: [
//                       sinLine(sinPoints),
//                       cosLine(cosPoints),
//                     ],
//                     titlesData: const FlTitlesData(show: false),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         : const SizedBox();
//   }
//
//   LineChartBarData sinLine(List<FlSpot> points) {
//     return LineChartBarData(
//       spots: points,
//       isCurved: false,
//       gradient: LinearGradient(
//         colors: [
//           sinColor.withOpacity(0),
//           sinColor,
//         ],
//         stops: const [0.1, 1.0],
//       ),
//       barWidth: 2,
//       dotData: const FlDotData(show: false),
//     );
//   }
//
//   LineChartBarData cosLine(List<FlSpot> points) {
//     return LineChartBarData(
//       spots: points,
//       isCurved: false,
//       gradient: LinearGradient(
//         colors: [
//           cosColor.withOpacity(0),
//           cosColor,
//         ],
//         stops: const [0.1, 1.0],
//       ),
//       barWidth: 2,
//       dotData: const FlDotData(show: false),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     timer.cancel();
//   }
// }
