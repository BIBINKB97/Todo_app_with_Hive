import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/database/database.dart';
import 'package:todo/utilities/todo_tile.dart';

import '../utilities/dialogue_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {



        return DialogeBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
 
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLwhite,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        centerTitle: true,
        title: const Text(
          "ToDo List",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: kblack),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoTile(
              deleteFunction: (contex) => deleteTask(index),
              taskName: db.toDoList[index][0],
              taskCompleated: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index));
        },
        itemCount: db.toDoList.length,
      ),
    );
  }
}
