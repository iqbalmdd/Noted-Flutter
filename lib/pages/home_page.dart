import 'package:flutter/material.dart';
import 'package:myapp/components/dialog_box.dart';
import 'package:myapp/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void changeStatus(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  List todoList = [
    ["First Task", false],
    ["Second Task", true],
  ];

  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text , false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void deleteTask (index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
  final _controller = TextEditingController();

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Noted",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 58, 70, 139),
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 64, 105, 151),
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Iqbal Muhammad",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                  taskName: todoList[index][0],
                  taskCompleted: todoList[index][1],
                  onChange: (value) => changeStatus(value, index),
                  deleteFuntion: (context) => deleteTask(index));
            }));
  }
}
