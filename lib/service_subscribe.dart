import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ServiceSubscribe extends StatefulWidget {
  const ServiceSubscribe({super.key});

  @override
  State<ServiceSubscribe> createState() => _ServiceSubscribeState();
}

class _ServiceSubscribeState extends State<ServiceSubscribe> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(x: 'Service Name 1', y: 15, color: Colors.blue),
      ChartData(x: 'Service Name 2', y: 25, color: Colors.green),
      ChartData(x: 'Service Name 3', y: 15, color: Colors.yellow),
      ChartData(x: 'Service Name 4', y: 10, color: Colors.grey),
      ChartData(x: 'Service Name 4', y: 35, color: Colors.black),
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfCircularChart(
            title: ChartTitle(
              text: "Services Subscriptions",
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            series: <CircularSeries<ChartData, String>>[
              DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelMapper: (ChartData data, _) => data.x,
                pointColorMapper: (ChartData data, _) => data.color,
                // radius: '60%',
                //enableTooltip: true,
                // explode: true,
                // explodeAll: true,
                // explode: true,
                // explodeIndex: 1,
                //innerRadius: "60%",
                groupMode: CircularChartGroupMode.point,
                //pointRenderMode: ,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  // Avoid labels intersection
                  labelIntersectAction: LabelIntersectAction.shift,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.line,
                    //length: '25%',
                  ),
                ),
              ),
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: const Center(
                  child: Text(
                    'Top five \n subscribed \n services',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
            enableMultiSelection: true,
            tooltipBehavior: TooltipBehavior(
              shouldAlwaysShow: true,
              tooltipPosition: TooltipPosition.auto,
              activationMode: ActivationMode.singleTap,
              canShowMarker: true,
              shared: true,
            ),
            selectionGesture: ActivationMode.singleTap,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData({this.x, this.y, this.color});

  Color? color;
  final String? x;
  final num? y;
}
