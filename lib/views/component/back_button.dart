import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }
}
