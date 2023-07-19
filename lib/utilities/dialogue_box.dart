import 'package:flutter/material.dart';
import 'my_buttons.dart';

// ignore: must_be_immutable
class DialogeBox extends StatelessWidget {
  DialogeBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                SizedBox(
                  width: 20,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
