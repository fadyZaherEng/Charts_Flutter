import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserStateChart extends StatefulWidget {
  const UserStateChart({super.key});

  @override
  State<UserStateChart> createState() => _UserStateChartState();
}

class _UserStateChartState extends State<UserStateChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Pending', 5, Colors.grey),
      ChartData('Scaned', 10, Colors.amber),
      ChartData('Completed', 2, Colors.green),
      ChartData('Hold', 3, Colors.red),
    ].reversed.toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "States",
                      softWrap: true,
                      strutStyle: StrutStyle(
                        forceStrutHeight: true,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 18,
                        textBaseline: TextBaseline.ideographic,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: CategoryAxis(isVisible: false),
                      // trackballBehavior:
                      //     TrackballBehavior(shouldAlwaysShow: true),
                      // tooltipBehavior: TooltipBehavior(
                      //     // enable: true,
                      //     tooltipPosition: TooltipPosition.auto,
                      //     shouldAlwaysShow: true),
                      // title: ChartTitle(
                      //   text: "Number Of Scan",
                      //   alignment: ChartAlignment.center,
                      //   textStyle: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 18,
                      //     color: Colors.grey,
                      //   ),
                      // ),

                      series: <ChartSeries<ChartData, String>>[
                        BarSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          yAxisName: "States",
                          xAxisName: "Number Of Scan",
                          isVisibleInLegend: true,
                          enableTooltip: true,
                          isVisible: true,
                          pointColorMapper: (ChartData data, _) => data.color,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Number Of Scans",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  Color color;
  final String x;
  final double y;
}
