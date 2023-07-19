import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/screens/home_screen.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
//open a box
  var box = await Hive.openBox('Mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
