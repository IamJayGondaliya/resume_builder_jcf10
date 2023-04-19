import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';
import 'package:resume_builder_jcf10/views/component/my_snackbar.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  bool switchVal = false;
  bool isRunning = false;

  int s = 0;

  double x = 0;
  double y = 0;

  startTimer() {
    if (isRunning) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          (s < 59) ? s++ : s = 0;
        });
        startTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        });

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(),
          title: Text(
            "Education Page",
            style: appBarTitleStyle,
          ),
          actions: [
            Transform.scale(
              // scale: 0.8,
              scaleX: 0.7,
              scaleY: 0.5,
              child: Switch(
                value: switchVal,
                onChanged: (val) {
                  setState(() {
                    switchVal = val;
                  });
                },
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    mySnackBar(
                      text: "Successfully validated !!",
                      color: Colors.green,
                    ),
                  );
                },
                child: const Text("Show snackBar"),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    mySnackBar(
                      text: "Not validated !!",
                      color: Colors.red,
                    ),
                  );
                },
                child: const Text("CLOSE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
