import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CashFlowChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CashFlowChart({Key? key}) : super(key: key);

  @override
  _CashFlowChartState createState() => _CashFlowChartState();
}

class _CashFlowChartState extends State<CashFlowChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Wed \n 15', 300),
      ChartData('Thu \n 16', 100),
      ChartData('Fri \n 17', 150),
      ChartData('Sat \n 18', 800),
      ChartData('Sun \n 19', 500)
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Payment For Last Five Days'),
            // Enable legend
            //legend: const Legend(isVisible: true),
            // Enable tooltip
            enableMultiSelection: true,
            tooltipBehavior: TooltipBehavior(
              enable: true,
              canShowMarker: true,
              shouldAlwaysShow: true,
            ),
            enableAxisAnimation: true,
            enableSideBySideSeriesPlacement: true,
            series: <CartesianSeries>[
              LineSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                xAxisName: "Days (Nov) 2023",
                yAxisName: "Amount (EGP)",
                pointColorMapper: (ChartData data, idx) =>
                    Colors.grey.withOpacity(0.4),
                isVisible: true,
                enableTooltip: true,
                isVisibleInLegend: true,
                name: "",
                // Renders the marker
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  color: Colors.blue,
                  borderWidth: 2,
                ),
                //dataLabelMapper: (ChartData data, _) => data.x,
                selectionBehavior: SelectionBehavior(
                  enable: true,
                  selectedColor: Colors.blue,
                  unselectedColor: Colors.green,
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: false,
                  labelPosition: ChartDataLabelPosition.inside,
                ),
                emptyPointSettings: EmptyPointSettings(
                  color: Colors.blue,
                  mode: EmptyPointMode.average,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double? y;
}
