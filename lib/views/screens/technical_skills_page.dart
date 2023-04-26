import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/modals/globals.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';

class TechnicalSkillsPage extends StatefulWidget {
  const TechnicalSkillsPage({Key? key}) : super(key: key);

  @override
  State<TechnicalSkillsPage> createState() => _TechnicalSkillsPageState();
}

class _TechnicalSkillsPageState extends State<TechnicalSkillsPage> {
  @override
  void dispose() {
    super.dispose();

    Global.mySkillsControllers.removeWhere((element) {
      if (element.text == "") {
        print("REMOVED: ${Global.mySkillsControllers.indexOf(element)}\t\tVALUE: ${element.text}");
        return true;
      } else {
        print("SKIPPED: ${Global.mySkillsControllers.indexOf(element)}\t\tVALUE: ${element.text}");
        return false;
      }
    });

    Global.mySkillsControllers.forEach((element) {
      Global.mySkills.add("");
      Global.mySkills[Global.mySkillsControllers.indexOf(element)] = element.text;
    });

    Global.mySkills.removeWhere((element) => element == "");

    if (Global.mySkillsControllers.isEmpty) {
      for (int i = 0; i < 2; i++) {
        Global.mySkillsControllers.add(TextEditingController());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (Global.mySkillsControllers.isEmpty) {
      for (int i = 0; i < 2; i++) {
        Global.mySkillsControllers.add(TextEditingController());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: const MyBackButton(),
        title: Text(
          "Technical Skills Page",
          style: appBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          padding: const EdgeInsets.all(24),
          color: Colors.white,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter your skills",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ...List.generate(
                Global.mySkillsControllers.length,
                (index) => MySkillTile(index: index),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Global.mySkillsControllers.add(TextEditingController());
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget MySkillTile({required int index}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: Global.mySkillsControllers[index],
            decoration: const InputDecoration(
              hintText: "C Programming, Web",
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              Global.mySkillsControllers.removeAt(index);
            });
          },
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }
}
