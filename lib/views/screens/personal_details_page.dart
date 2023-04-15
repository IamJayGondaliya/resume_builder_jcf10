import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  String? maritalStatus;
  bool isChecked = false;

  RangeValues range = const RangeValues(10, 50);

  bool switchVal = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Details Page",
          style: appBarTitleStyle,
        ),
        leading: const MyBackButton(),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          width: s.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DOB"),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Marital Status"),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: "Single",
                title: const Text("Single"),
                subtitle: const Text("Yet free to live !!"),
                groupValue: maritalStatus,
                onChanged: (val) {
                  setState(() {
                    maritalStatus = val;
                  });
                },
              ),
              RadioListTile(
                value: "Married",
                title: Text(
                  "Married",
                  style: TextStyle(
                    color:
                        maritalStatus == "Married" ? Colors.red : Colors.black,
                  ),
                ),
                subtitle: const Text("So far lost their freedom !!"),
                tileColor: Colors.blue,
                groupValue: maritalStatus,
                onChanged: (val) {
                  setState(() {
                    maritalStatus = val;
                  });
                },
              ),
              CheckboxListTile(
                value: isChecked,
                // activeColor: Colors.green,
                // checkColor: Colors.black,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(30),
                // ),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("English"),
                subtitle:
                    const Text("Second language english is also applicable !!"),
                onChanged: (val) {
                  setState(() {
                    isChecked = val!;
                  });
                },
              ),
              RangeSlider(
                min: 0,
                max: 100,
                values: range,
                labels: RangeLabels(
                  range.start.toInt().toString(),
                  range.end.toInt().toString(),
                ),
                activeColor: Colors.green,
                inactiveColor: Colors.red.shade200,
                divisions: 20,
                onChanged: (val) {
                  setState(() {
                    range = val;
                  });
                },
              ),
              Switch(
                value: switchVal,
                onChanged: (val) {
                  setState(() {
                    switchVal = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
