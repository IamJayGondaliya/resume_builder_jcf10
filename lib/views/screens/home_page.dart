import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/modals/globals.dart';
import 'package:resume_builder_jcf10/utils/icon_utils.dart';
import 'package:resume_builder_jcf10/utils/route_utils.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        bool willPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Are you sure to exit ?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"),
              ),
            ],
          ),
        );

        await Future.delayed(
          Duration(seconds: 1),
        );

        return willPop;
      },
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Column(
            children: [
              Text(
                "Resume Builder",
                style: appBarTitleStyle,
              ),
              SizedBox(
                height: s.height * 0.07,
              ),
              Text(
                "RESUMES",
                style: appBarTitleStyle,
              ),
            ],
          ),
          centerTitle: true,
          toolbarHeight: 150,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: s.height * 0.08,
              ),
              Image.asset(
                iconPath + "open-cardboard-box.png",
                height: 80,
                color: Colors.red.shade200,
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Text(
                "No resumes yet !!\nClick + to create new resume.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(MyRoutes.workspace);
          },
          tooltip: "Create new resume",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
