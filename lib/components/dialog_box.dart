import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {

  final TextEditingController controller;
  VoidCallback onSave ;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.task,
        color: const Color.fromARGB(255, 58, 70, 139),
      ),
      title: Text("New Task"),
      // backgroundColor: const Color.fromARGB(255, 58, 70, 139),
      content: SizedBox(
        height: 120, 
        width: 200, 
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: onSave, child: Text("Save")),
                ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
              ],
            ),
          ],
      )),
    );
  }
}
