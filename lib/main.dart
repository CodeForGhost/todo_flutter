import 'package:flutter/material.dart';
import 'package:todo/models/db_model.dart';
import 'package:todo/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/screens/home_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var db = DatabaseConnect();
  // await db.insertTodo(TodoModel(
  //     id: 1, title: 'title', creationDate: DateTime.now(), isChecked: false));

  // print(await db.getTodo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
