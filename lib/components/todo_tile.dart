import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChange;
  Function(BuildContext) deleteFuntion;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange,
      required this.deleteFuntion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Dismissible(
        key: ValueKey(taskName),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          deleteFuntion(context);
        },
        background: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 186, 64, 56),
            borderRadius: BorderRadius.circular(12), // Bikin border melengkung
          ),
          padding: EdgeInsets.only(right: 25),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            size: 30,
            color: Colors.white,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 64, 105, 151), width: 3),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(taskName,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                activeColor: const Color.fromARGB(255, 58, 70, 139),
              )
            ],
          ),
        ),
      ),
    );
  }
}
