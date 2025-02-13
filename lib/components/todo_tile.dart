import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), extentRatio: 0.3, children: [
          CustomSlidableAction(
            onPressed: deleteFuntion,
            backgroundColor: const Color.fromARGB(255, 176, 51, 42),
            borderRadius: BorderRadius.circular(12),
            child: Icon(
              Icons.delete,
              size: 30,
            ),
          )
        ]),
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
