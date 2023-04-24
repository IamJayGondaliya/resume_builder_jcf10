import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_jcf10/modals/globals.dart';
import 'package:resume_builder_jcf10/utils/icon_utils.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';
import 'package:resume_builder_jcf10/views/component/my_snackbar.dart';
import 'package:image_picker/image_picker.dart';

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

  TextEditingController nameController = TextEditingController(text: Global.name);

  AutovalidateMode mode = AutovalidateMode.disabled;

  ImagePicker picker = ImagePicker();

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
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: index == 1 ? 3 : 0,
                            color: Colors.amber,
                          ),
                        ),
                        color: Colors.red,
                      ),
                      child: Text(
                        "Photo",
                        style: appBarTitleStyle,
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
                      autovalidateMode: mode,
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
                                    controller: nameController,
                                    // initialValue: Global.name,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter name...";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      Global.name = val;
                                    },
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
                                    initialValue: Global.email,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter email...";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      Global.email = val;
                                    },
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
                                    initialValue: (Global.contact == null) ? null : Global.contact.toString(),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter contact...";
                                      } else if (val!.length < 10) {
                                        return "Contact number must have 10 digits...";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      Global.contact = int.parse(val!);
                                    },
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
                                    initialValue: Global.a1,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please enter address...";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      Global.a1 = val;
                                    },
                                    onFieldSubmitted: (val) {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          mySnackBar(
                                            text: "Successfully validated !!",
                                            color: Colors.green,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          mySnackBar(
                                            text: "Failled to validate !!",
                                            color: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Address",
                                      hintText: "Enter address line 1",
                                    ),
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
                                  onPressed: () {
                                    setState(() {
                                      mode = AutovalidateMode.onUserInteraction;

                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          mySnackBar(
                                            text: "Successfully validated !!",
                                            color: Colors.green,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          mySnackBar(
                                            text: "Failled to validate !!",
                                            color: Colors.red,
                                          ),
                                        );
                                      }
                                    });
                                  },
                                  child: const Text("Save"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      formKey.currentState!.reset();

                                      nameController.clear();

                                      Global.name = Global.email = Global.contact = Global.a1 = Global.a2 = Global.a3 = null;
                                    });
                                  },
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
                  Container(
                    height: 250,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          foregroundImage: (Global.image != null) ? FileImage(Global.image!) : null,
                          child: const Text("ADD"),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Select the method !!"),
                                actions: [
                                  TextButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();

                                      XFile? img = await picker.pickImage(source: ImageSource.camera);

                                      if (img != null) {
                                        setState(() {
                                          Global.image = File(img.path);
                                        });
                                      }
                                    },
                                    label: const Text("Camera"),
                                    icon: const Icon(Icons.camera_alt),
                                  ),
                                  TextButton.icon(
                                    onPressed: () async {
                                      XFile? img = await picker.pickImage(source: ImageSource.gallery);

                                      if (img != null) {
                                        setState(() {
                                          Global.image = File(img.path);
                                        });
                                      }

                                      Navigator.of(context).pop();
                                    },
                                    label: const Text("Gallery"),
                                    icon: const Icon(Icons.image),
                                  ),
                                ],
                              ),
                            );
                          },
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(Icons.camera),
                        ),
                      ],
                    ),
                  ),
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
