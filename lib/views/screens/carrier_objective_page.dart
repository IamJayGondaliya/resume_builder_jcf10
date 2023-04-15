import 'package:flutter/material.dart';

class CarrierObjectivePage extends StatefulWidget {
  const CarrierObjectivePage({Key? key}) : super(key: key);

  @override
  State<CarrierObjectivePage> createState() => _CarrierObjectivePageState();
}

class _CarrierObjectivePageState extends State<CarrierObjectivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CarrierObjectivePage"),
        centerTitle: true,
      ),
    );
  }
}
