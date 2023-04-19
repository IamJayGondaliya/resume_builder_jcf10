import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  FlutterLogoStyle myStyle = FlutterLogoStyle.markOnly;

  int index = 0;

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
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Contact",
                        style: appBarTitleStyle,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: index == 0 ? 3 : 0,
                            color: Colors.amber,
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Photo",
                        style: appBarTitleStyle,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: index == 1 ? 3 : 0,
                            color: Colors.amber,
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: IndexedStack(
                index: index,
                children: [
                  Text("Contact Page"),
                  Text("Image Page"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
