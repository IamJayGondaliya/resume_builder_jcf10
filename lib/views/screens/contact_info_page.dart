import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ContactInfoPage",
          style: appBarTitleStyle,
        ),
        leading: const MyBackButton(),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Demo Alert"),
                    content: const Text("Body of dialog !!"),
                    // icon: Icon(Icons.warning),
                  ),
                );
              },
              child: const Text("Simple Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    title: const Text("Demo Alert"),
                    content: const Text("Body of dialog !!"),
                    // icon: Icon(Icons.warning),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("CANCEl"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Conformational Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    titlePadding: EdgeInsets.zero,
                    title: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.red.shade400,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Text("Decorative dialog !!"),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                    content: const Text("Body of dialog !!"),
                    // icon: Icon(Icons.warning),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("CANCEl"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Decorative Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
