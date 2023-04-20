import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_jcf10/utils/icon_utils.dart';
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

  bool hide = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double iconSize = size.height * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ContactInfo Page",
          style: appBarTitleStyle,
        ),
        leading: const MyBackButton(),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: [
          //TabBar
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
                  //Contact Page
                  Container(
                    padding: const EdgeInsets.all(18),
                    color: Colors.white,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    iconPath + "user.png",
                                    height: iconSize,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "Enter name",
                                      labelText: "Name",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  iconPath + "email.png",
                                  height: iconSize,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Enter email",
                                      labelText: "Email",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  iconPath + "smartphone-call.png",
                                  height: iconSize,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    maxLength: 10,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: const InputDecoration(
                                      hintText: "Enter mobile number",
                                      labelText: "Mobile no.",
                                      prefixText: "+91 ",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  iconPath + "pin.png",
                                  height: iconSize,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Save"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Reset"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Photo Page
                  Text("Image Page"),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
