import 'package:flutter/material.dart';
import 'package:todo/models/db_model.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/todo_card_widget.dart';
import 'package:todo/widgets/todo_list_widget.dart';
import 'package:todo/widgets/user_input_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = DatabaseConnect();

  void addItem(TodoModel todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(TodoModel todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo')),
      body: Column(
        children: [
          TodoList(
            deleteFunction: deleteItem,
            insertFunction: addItem,
          ),
          UserInput(
            insertFunction: addItem,
          ),
        ],
      ),
    );
  }
}
