import 'package:charts/cash_flow.dart';
import 'package:charts/service_subscribe.dart';
import 'package:charts/user_state.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChartOptions(),
    );
  }
}

class ChartOptions extends StatefulWidget {
  const ChartOptions({super.key});

  @override
  State<ChartOptions> createState() => _ChartOptionsState();
}

class _ChartOptionsState extends State<ChartOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CashFlowChart(),
                    ),
                  );
                },
                child: const Text("Cash Flow"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserStateChart(),
                    ),
                  );
                },
                child: const Text("User State"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ServiceSubscribe(),
                    ),
                  );
                },
                child: const Text("Service Subscribe"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
