import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  double _starValue = 10;
  double _endValue = 80;
  double minValue = 0.0;
  double maxValue = 100.0;

  final startController = TextEditingController();
  final endController = TextEditingController();

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    startController.addListener(_setStartValue);
    endController.addListener(_setEndValue);
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  _setStartValue() {
    if (double.parse(startController.text).roundToDouble() <=
            double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _starValue = double.parse(startController.text).roundToDouble();
      });
    }
    debugPrint("Second text field: ${startController.text}");
  }

  _setEndValue() {
    if (double.parse(startController.text).roundToDouble() <=
            double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _endValue = double.parse(endController.text).roundToDouble();
      });
    }
    debugPrint("Second text field: ${endController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Enter  start value'),
              controller: startController,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Enter end value'),
              controller: endController,
            ),
            RangeSlider(
              values: RangeValues(_starValue, _endValue),
              min: minValue,
              max: maxValue,
              onChanged: (values) {
                setState(() {
                  _starValue = values.start.roundToDouble();
                  _endValue = values.end.roundToDouble();
                  startController.text =
                      values.start.roundToDouble().toString();
                  endController.text = values.end.roundToDouble().toString();
                });
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
