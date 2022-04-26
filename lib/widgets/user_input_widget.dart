import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  final Function insertFunction;
  UserInput({Key? key, required this.insertFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 171, 217, 255),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(children: [
        Expanded(
          child: Container(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Add Todo',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            var myTodo = TodoModel(
                title: textController.text,
                creationDate: DateTime.now(),
                isChecked: false);
            insertFunction(myTodo);
          },
          child: Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Add',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
