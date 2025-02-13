import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase {
  List todoList = [];

  // reference box
  final Box _myBox;

  todoDatabase(this._myBox);

  // for initial data
  void createInitalData() {
    todoList = [
      ["First Task", false],
      ["Second Task", true],
    ];
  }

  // Load data from db
  void loadData() {
    todoList = _myBox.get("Todolist");
  }

  // Update db data
  void updateData() {
    _myBox.put("Todolist", todoList);
  }
}
