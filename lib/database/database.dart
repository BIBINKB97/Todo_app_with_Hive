import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ["morning workout", false],
      ["wash car ", false],
       ["clean the room ", false],
        ["Read the book Atomic Habits", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
